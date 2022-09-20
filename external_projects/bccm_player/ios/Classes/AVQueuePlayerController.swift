//
// Created by Andreas Gangsø on 16/09/2022.
//

import Foundation
import AVFoundation
import AVKit
import YouboraLib
import YouboraAVPlayerAdapter

public class AVQueuePlayerController: PlayerController {
    public func play() {
        player.play()
    }
    
    public func pause() {
        player.pause()
    }
    
    public func stop(reset: Bool) {
        if (reset) {
            player.removeAllItems();
        } else {
            player.pause();
        }
    }
    
    lazy var player: AVQueuePlayer = AVQueuePlayer()
    public final let id: String
    final let playbackListener: PlaybackListenerPigeon
    final var observers = [NSKeyValueObservation]()
    var temporaryStatusObserver: NSKeyValueObservation? = nil
    var youboraPlugin: YBPlugin

    init(id: String? = nil, playbackListener: PlaybackListenerPigeon, npawConfig: NpawConfig?) {
        self.id = id ?? UUID().uuidString;
        self.playbackListener = playbackListener
        let youboraOptions = YBOptions();
        youboraOptions.enabled = npawConfig != nil;
        youboraOptions.accountCode = npawConfig?.accountCode;
        youboraOptions.appName = npawConfig?.appName;
        youboraOptions.appReleaseVersion = npawConfig?.appReleaseVersion;
        youboraPlugin = YBPlugin(options: youboraOptions)
        youboraPlugin.adapter = YBAVPlayerAdapterSwiftTranformer.transform(from: YBAVPlayerAdapter(player: player))
        youboraPlugin.firePreloadBegin()
        addObservers();
        print("BTV DEBUG: end of init playerController")
    }

    func npawHandleMediaItemUpdate(playerItem: AVPlayerItem?, extras: [String: String]) {
        guard #available(iOS 12.2, *) else {
            // AVPlayerItem.externalMetadata isn't available < 12.2
            // TODO: check what people did before that
            return;
        }
        let duration = player.currentItem?.duration
        let isLive = (extras["npaw.content.isLive"] as NSString?)?.boolValue ?? (player.currentItem?.status == AVPlayerItem.Status.readyToPlay && duration != nil ? CMTIME_IS_INDEFINITE(duration!) : nil);
        youboraPlugin.options.contentIsLive = isLive as NSValue?;
        youboraPlugin.options.contentId = extras["npaw.content.id"] ?? extras["id"];
        youboraPlugin.options.contentTitle = extras["npaw.content.title"] ?? playerItem?.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierTitle })?.stringValue
        youboraPlugin.options.contentTvShow = extras["npaw.content.tvShow"];
        youboraPlugin.options.contentSeason = extras["npaw.content.season"];
        youboraPlugin.options.contentEpisodeTitle = extras["npaw.content.episodeTitle"];
    }

    public func updateNpawConfig(npawConfig: NpawConfig?) {
        youboraPlugin.options.enabled = npawConfig != nil;
        youboraPlugin.options.accountCode = npawConfig?.accountCode;
        youboraPlugin.options.appName = npawConfig?.appName;
        youboraPlugin.options.appReleaseVersion = npawConfig?.appReleaseVersion;
    }

    public func setMediaItem(_ mediaItem: MediaItem) {
        let playerItem = mapMediaItem(mediaItem);
        player.replaceCurrentItem(with: playerItem)
        guard let playbackStartPositionMs = mediaItem.playbackStartPositionMs else {
            return;
        }
    
        temporaryStatusObserver = playerItem.observe(\.status, options: [.new, .old]) {
            (player, change) in
            switch (player.status) {
                case .readyToPlay:
                playerItem.seek(to: CMTime(value: Int64(truncating: playbackStartPositionMs), timescale: 1000), completionHandler: nil)
                case .failed, .unknown:
                        print("Media Failed to Play")
                @unknown default:
                     break
            }
        }
    }
    
    public func getPlayer() -> AVQueuePlayer {
        return player;
    }

    public func queueItem(_ mediaItem: MediaItem) {
        let playerItem = mapMediaItem(mediaItem);
        player.insert(playerItem, after: nil);
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
    
    func mapMediaItem(_ mediaItem: MediaItem) -> AVPlayerItem {
        let playerItem = AVPlayerItem(url: URL(string: mediaItem.url)!);

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
        
        return playerItem;
    }
    
    func mapMetadata(_ items: [AVMetadataItem]) -> [String: String] {
        items.filter({
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
    }
    
    func addObservers() {
        // listening for current item change
        observers.append(player.observe(\.currentItem, options: [.old, .new]) {
            (player, _) in
            debugPrint("BTV DEBUG: media item changed...")
            let emptyEvent = MediaItemTransitionEvent.make(withPlayerId: self.id, mediaItem: nil)
            guard let currentItem = player.currentItem else {
                return self.playbackListener.onMediaItemTransition(emptyEvent, completion: { _ in })
            }
            guard let url = (currentItem.asset as? AVURLAsset)?.url.absoluteString else {
                return self.playbackListener.onMediaItemTransition(emptyEvent, completion: { _ in })
            }
            var metadata: MediaMetadata? = nil
            if #available(iOS 12.2, *) {
                var extras = [String: String]();
                if (player.currentItem?.externalMetadata != nil) {
                    extras = self.mapMetadata(currentItem.externalMetadata)
                }

                metadata = MediaMetadata.make(
                        withArtworkUri: currentItem.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierArtwork })?.stringValue,
                        title: currentItem.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierTitle })?.stringValue,
                        artist: currentItem.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierArtist })?.stringValue,
                        episodeId: currentItem.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier(MetadataConstants.EpisodeId) })?.stringValue,
                        extras: extras
                )

                self.npawHandleMediaItemUpdate(playerItem: player.currentItem, extras: extras);
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
}
