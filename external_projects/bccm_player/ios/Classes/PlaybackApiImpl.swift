import Foundation
import AVKit

public class PlaybackApiImpl: NSObject, PlaybackPlatformPigeon {
    var players = [PlayerController]()
    let playbackListener: PlaybackListenerPigeon
    var user: User? = nil

    init(playbackListener: PlaybackListenerPigeon) {
        self.playbackListener = playbackListener
        super.init()
        let castPlayer = PlayerController(id: "chromecast", playbackListener: playbackListener);
        players.append(castPlayer);
    }

    public func setUser(_ user: User?, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        self.user = user;
    }

    public func setNpawConfig(_ config: NpawConfig?, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        // TODO: implement
    }

    public func getPlayer(_ id: String) -> PlayerController? {
        players.first(where: { $0.id == id })
    }

    public func setPrimary(_ id: String, completion: @escaping (FlutterError?) -> Void) {
        completion(nil)
    }

    public func newPlayer(_ url: String?, completion: @escaping (String?, FlutterError?) -> Void) {
        let player = PlayerController(playbackListener: playbackListener);
        players.append(player)
        if (url != nil) {
            player.setMediaItem(MediaItem.make(withUrl: url!, mimeType: "application/x-mpegURL", metadata: nil, isLive: false, playbackStartPositionMs: nil))
        }
        completion(player.id, nil)
    }

    public func getChromecastState(_ completion: @escaping (ChromecastState?, FlutterError?) -> Void) {
        completion(ChromecastState.make(with: CastConnectionState.noDevicesAvailable), nil);
    }

    public func queueMediaItem(_ playerId: String, mediaItem: MediaItem, completion: (FlutterError?) -> ()) {
        let player = getPlayer(playerId);
        player?.queueItem(AVPlayerItem(url: URL(string: mediaItem.url)!))
        completion(nil)
    }

    public func replaceCurrentMediaItem(_ playerId: String, mediaItem: MediaItem, playbackPositionFromPrimary: NSNumber?, completion: (FlutterError?) -> ()) {
        let player = getPlayer(playerId);

        player?.setMediaItem(mediaItem)
        completion(nil)
    }


    public func play(_ playerId: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let player = getPlayer(playerId);
        player?.player.play();
    }

    public func pause(_ playerId: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let player = getPlayer(playerId);
        player?.player.pause();
    }

    public func stop(_ playerId: String, reset: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let player = getPlayer(playerId);
        if (reset.boolValue) {
            player?.player.removeAllItems();
        } else {
            player?.player.pause();
        }
    }
}
