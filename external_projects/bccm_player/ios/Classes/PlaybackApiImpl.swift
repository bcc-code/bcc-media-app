import AVKit
import Foundation
import GoogleCast

// Implementation of the PlaybackPlatformPigeon
// See pigeons/playback_platform_pigeon.dart
// TODO: this file should be a pure api towards flutter,
// we should move the "players" array and state into a dedicated class
public class PlaybackApiImpl: NSObject, PlaybackPlatformPigeon {
    var players = [PlayerController]()
    private var primaryPlayerId: String? = nil
    private var previousPrimaryPlayerId: String? = nil
    let playbackListener: PlaybackListenerPigeon
    let chromecastPigeon: ChromecastPigeon
    var npawConfig: NpawConfig? = nil
    var appConfig: AppConfig? = nil

    init(chromecastPigeon: ChromecastPigeon, playbackListener: PlaybackListenerPigeon) {
        self.playbackListener = playbackListener
        self.chromecastPigeon = chromecastPigeon
        super.init()
        let castPlayerController = CastPlayerController(playbackApi: self)
        players.append(castPlayerController)
        newPlayer(nil, completion: { playerId, _ in
            if playerId != nil {
                self.setPrimary(playerId!, completion: { _ in })
            }
        })
    }

    public func attach(completion: @escaping (FlutterError?) -> Void) {
        completion(nil)
    }

    public func setAppConfig(_ config: AppConfig?, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        appConfig = config
        for p in players {
            p.updateAppConfig(appConfig: appConfig)
        }
    }

    public func setPlayerViewVisibility(_ viewId: NSNumber, visible: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {}

    public func setNpawConfig(_ config: NpawConfig?, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        npawConfig = config
    }

    public func getPlayer(_ id: String) -> PlayerController? {
        players.first(where: { $0.id == id })
    }

    public func getPrimaryPlayer() -> PlayerController? {
        players.first(where: { $0.id == primaryPlayerId })
    }

    public func setPrimary(_ id: String, completion: @escaping (FlutterError?) -> Void) {
        if primaryPlayerId == id { return }
        previousPrimaryPlayerId = primaryPlayerId
        primaryPlayerId = id
        getPrimaryPlayer()?.hasBecomePrimary()
        playbackListener.onPrimaryPlayerChanged(PrimaryPlayerChangedEvent.make(withPlayerId: id), completion: { _ in })
        completion(nil)
    }

    public func newPlayer(_ url: String?, completion: @escaping (String?, FlutterError?) -> Void) {
        let player = AVQueuePlayerController(playbackListener: playbackListener, npawConfig: npawConfig, appConfig: appConfig)
        players.append(player)
        if url != nil {
            let mediaItem = MediaItem.make(withUrl: url!, mimeType: "application/x-mpegURL", metadata: nil, isLive: false, playbackStartPositionMs: nil, lastKnownAudioLanguage: nil, lastKnownSubtitleLanguage: nil)
            player.replaceCurrentMediaItem(mediaItem, autoplay: false, completion: {
                err in
                let playerId = err == nil ? player.id : nil
                completion(playerId, err)
            })
        }
        completion(player.id, nil)
    }

    public func getChromecastState(_ completion: @escaping (ChromecastState?, FlutterError?) -> Void) {
        let castPlayer = players.first(where: { $0.id == CastPlayerController.DEFAULT_ID })
        let mediaItem = castPlayer?.getCurrentItem()

        let connectionStateRaw = GCKCastContext.sharedInstance().castState.rawValue + 1
        let connectionState = CastConnectionState(rawValue: UInt(connectionStateRaw))
        if connectionState != nil {
            completion(ChromecastState.make(with: connectionState!, mediaItem: mediaItem), nil)
        } else {
            completion(ChromecastState.make(with: CastConnectionState.noDevicesAvailable, mediaItem: mediaItem), nil)
        }
    }

    public func openExpandedCastController(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        GCKCastContext.sharedInstance().presentDefaultExpandedMediaControls()
    }

    public func openCastDialog(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        GCKCastContext.sharedInstance().presentCastDialog()
    }

    public func queueMediaItem(_ playerId: String, mediaItem: MediaItem, completion: (FlutterError?) -> Void) {
        let player = getPlayer(playerId)
        player?.queueItem(mediaItem)
        completion(nil)
    }

    public func replaceCurrentMediaItem(_ playerId: String, mediaItem: MediaItem, playbackPositionFromPrimary: NSNumber?, autoplay: NSNumber?, completion: @escaping (FlutterError?) -> Void) {
        let player = getPlayer(playerId)

        player?.replaceCurrentMediaItem(mediaItem, autoplay: autoplay, completion: completion)
    }

    public func getPlayerState(_ playerId: String?, completion: @escaping (PlayerStateSnapshot?, FlutterError?) -> Void) {
        let player = playerId == nil ? getPrimaryPlayer() : getPlayer(playerId!)
        let snapshot = player?.getPlayerStateSnapshot()
        completion(snapshot, nil)
    }

    public func play(_ playerId: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let player = getPlayer(playerId)
        player?.play()
    }

    public func pause(_ playerId: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let player = getPlayer(playerId)
        player?.pause()
    }

    public func stop(_ playerId: String, reset: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let player = getPlayer(playerId)
        player?.stop(reset: reset.boolValue)
    }

    public func exitFullscreen(_ playerId: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let player = getPlayer(playerId)
        player?.exitFullscreen()
    }
}

public extension PlaybackApiImpl {
    func unclaimIfPrimary(_ playerId: String) {
        if primaryPlayerId != playerId { return }
        if let previousPrimaryPlayerId, let previous = getPlayer(previousPrimaryPlayerId) {
            setPrimary(previous.id, completion: { _ in })
            return
        }
        if let player = players.first(where: { $0 is AVQueuePlayerController }) {
            setPrimary(player.id, completion: { _ in })
            return
        }
        primaryPlayerId = nil
        playbackListener.onPrimaryPlayerChanged(PrimaryPlayerChangedEvent.make(withPlayerId: nil), completion: { _ in })
        assertionFailure("unclaimIfPrimary was called, but no player was given primary.")
    }
}
