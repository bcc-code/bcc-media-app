import Foundation
import AVKit

public class PlayerController {
    lazy var player: AVQueuePlayer = AVQueuePlayer()
    public final let id: String
    final let playbackListener: PlaybackListenerPigeon
    final var observers = [NSKeyValueObservation]()

    init(id: String? = nil, playbackListener: PlaybackListenerPigeon) {
        self.id = id ?? UUID().uuidString;
        self.playbackListener = playbackListener
        addObservers();
        print("BTV DEBUG: end of init playercontroller")
    }

    func addObservers() {
        // listening for current item change
        observers.append(player.observe(\.currentItem, options: [.old, .new]) {
            (player, _) in
            debugPrint("BTV DEBUG: media item changed...")
            guard let url = ((player.currentItem?.asset) as? AVURLAsset)?.url.absoluteString else {
                let event = MediaItemTransitionEvent.make(withPlayerId: self.id, mediaItem: nil)
                self.playbackListener.onMediaItemTransition(event, completion: { _ in })
                return;
            }
            var metadata: MediaMetadata? = nil
            if #available(iOS 12.2, *) {

                let extras = player.currentItem?.externalMetadata.filter({
                            (value) in
                            let containsExtraPrefix = value.identifier?.rawValue.contains(MetadataConstants.ExtraPrefix) ?? false;
                            if (!containsExtraPrefix) {
                                return false;
                            }
                            return true;
                        })
                        .reduce(into: [String: String]()) {
                            (dict, val) in
                            if (val.identifier?.rawValue == nil || (val.value as? String) == nil) {
                                return
                            }
                            guard let range = val.identifier!.rawValue.range(of: MetadataConstants.ExtraPrefix) else {
                                return
                            }
                            let key = val.identifier!.rawValue[range.upperBound...];
                            dict[String(key)] = (val.value as! String)
                        };

                metadata = MediaMetadata.make(
                        withArtworkUri: player.currentItem?.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierArtwork })?.stringValue,
                        title: player.currentItem?.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierTitle })?.stringValue,
                        artist: player.currentItem?.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierArtist })?.stringValue,
                        episodeId: player.currentItem?.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier(MetadataConstants.EpisodeId) })?.stringValue,
                        extras: extras
                )
            }
            let mediaItem = MediaItem.make(withUrl: url, mimeType: "application/x-mpegURL", metadata: metadata, isLive: false, playbackStartPositionMs: nil)
            let event = MediaItemTransitionEvent.make(withPlayerId: self.id, mediaItem: mediaItem)
            self.playbackListener.onMediaItemTransition(event, completion: { _ in })
        })

        observers.append(player.observe(\.timeControlStatus, options: [.old, .new]) {
            (player, change) in
            debugPrint("BTV DEBUG: player status changed...")
            // We don't want "isPlaying" to be affected by stuttering
            // So we only check if the player is paused or doesnt have an item to play.
            let paused = player.timeControlStatus == AVPlayer.TimeControlStatus.paused;
            let waitingBecauseNoItemToPlay = player.timeControlStatus == AVPlayer.TimeControlStatus.waitingToPlayAtSpecifiedRate
                    && player.reasonForWaitingToPlay == AVPlayer.WaitingReason.noItemToPlay
            let isPlaying = !paused && !waitingBecauseNoItemToPlay;
            let event = IsPlayingChangedEvent.make(withPlayerId: self.id, isPlaying: isPlaying as NSNumber)
            self.playbackListener.onIsPlayingChanged(event, completion: { _ in })
        })
    }

    func takeOwnership(_ playerViewController: AVPlayerViewController) {
        playerViewController.player = player

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(true)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }

    func setMediaItem(_ mediaItem: MediaItem) {
        var playerItem = AVPlayerItem(url: URL(string: mediaItem.url)!);

        var allItems: [AVMetadataItem] = []
        if let metadataItem = MetadataUtils.metadataItem(identifier: AVMetadataIdentifier.commonIdentifierTitle.rawValue, value: mediaItem.metadata?.title as (NSCopying & NSObjectProtocol)?) {
            allItems.append(metadataItem)
        }
        if let artist = mediaItem.metadata?.artist {
            if let metadataItem = MetadataUtils.metadataItem(identifier: AVMetadataIdentifier.commonIdentifierArtist.rawValue, value: artist as (NSCopying & NSObjectProtocol)?) {
                allItems.append(metadataItem)
            }
        }
        if let artworkUri = mediaItem.metadata?.artworkUri {
            if let url = URL(string: artworkUri) {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        if let artworkItem = MetadataUtils.metadataArtworkItem(image: image) {
                            allItems.append(artworkItem)
                        }
                    }
                }
            }
        }
        if let episodeId = mediaItem.metadata?.episodeId {
            if let metadataItem = MetadataUtils.metadataItem(identifier: MetadataConstants.EpisodeId, value: episodeId as (NSCopying & NSObjectProtocol)?) {
                allItems.append(metadataItem)
            }
        }
        if let extras = mediaItem.metadata?.extras {
            for item in extras {
                if let metadataItem = MetadataUtils.metadataItem(identifier: item.key, value: item.value as (NSCopying & NSObjectProtocol)?, isExtra: true) {
                    allItems.append(metadataItem)
                }
            }
        }

        if #available(iOS 12.2, *) {
            playerItem.externalMetadata.append(contentsOf: allItems)
        } else {
            // Fallback on earlier versions
        }
        player.replaceCurrentItem(with: playerItem)
    }

    func queueItem(_ playerItem: AVPlayerItem) {
        player.insert(playerItem, after: nil);
    }
}

public class PlaybackApiImpl: NSObject, PlaybackPlatformPigeon {
    var players = [PlayerController]()
    let playbackListener: PlaybackListenerPigeon

    init(playbackListener: PlaybackListenerPigeon) {
        self.playbackListener = playbackListener
        super.init()
        let castPlayer = PlayerController(id: "chromecast", playbackListener: playbackListener);
        players.append(castPlayer);
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
