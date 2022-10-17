//
// Created by Andreas Gangsø on 16/09/2022.
//

import Foundation
import AVFoundation
import AVKit
import YouboraLib
import YouboraAVPlayerAdapter
import MediaPlayer

public class AVQueuePlayerController: NSObject, PlayerController, AVPlayerViewControllerDelegate {
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
    var pipController: AVPlayerViewController? = nil

    init(id: String? = nil, playbackListener: PlaybackListenerPigeon, npawConfig: NpawConfig?) {
        self.id = id ?? UUID().uuidString;
        self.playbackListener = playbackListener
        let youboraOptions = YBOptions();
        youboraOptions.enabled = npawConfig != nil;
        youboraOptions.accountCode = npawConfig?.accountCode;
        youboraOptions.appName = npawConfig?.appName;
        youboraOptions.appReleaseVersion = npawConfig?.appReleaseVersion;
        youboraPlugin = YBPlugin(options: youboraOptions)
        super.init()
        youboraPlugin.adapter = YBAVPlayerAdapterSwiftTranformer.transform(from: YBAVPlayerAdapter(player: player))
        addObservers();
        print("BTV DEBUG: end of init playerController")
    }
    
    public func hasBecomePrimary() {
        setupCommandCenter()
    }
    
    
    func registerPipController(_ playerView: AVPlayerViewController?) {
        pipController = playerView;
        let event = PictureInPictureModeChangedEvent.make(withPlayerId: id, isInPipMode: (playerView != nil) as NSNumber)
        playbackListener.onPicture(inPictureModeChanged: event, completion: { _ in })
    }
    
    public func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("bccm: audiosession category willstart: " + AVAudioSession.sharedInstance().category.rawValue)
        registerPipController(playerViewController)
    }
    
    public func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("playerViewControllerDidStartPictureInPicture")
    }
    public func playerViewController(_ playerViewController: AVPlayerViewController, willBeginFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        print("willBeginFullScreenPresentationWithAnimationCoordinator")
    }
    
    public func playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart(_ playerViewController: AVPlayerViewController) -> Bool {
        print("playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart");
        return false;
    }
//    public func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
//        print("restoreUserInterfaceForPictureInPictureStopWithCompletionHandler")
//        completionHandler(true)
//    }
    
    public func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("bccm: audiosession category willstop: " + AVAudioSession.sharedInstance().category.rawValue)
        registerPipController(nil)
        let audioSession = AVAudioSession.sharedInstance()
        print("bccm: audiosession category before: " + audioSession.category.rawValue)
        do {
            try audioSession.setCategory(.playback)
            try audioSession.setActive(true)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    func releasePlayerView(_ playerView: AVPlayerViewController) {
        if (playerView != pipController) {
            print ("releasing")
            playerView.player = nil
            
        }
    }
    
    func setupCommandCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.playCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.player.play()
            return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.player.pause()
            return .success
        }
        
        
        let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
        nowPlayingInfoCenter.nowPlayingInfo = [:]
    }
    
    @objc func playAudio() {
        player.play()
    }
    @objc func pauseAudio() {
        player.pause()
    }
    
    func npawHandleMediaItemUpdate(playerItem: AVPlayerItem?, extras: [String: String]?) {
        guard #available(iOS 12.2, *) else {
            // AVPlayerItem.externalMetadata isn't available < 12.2
            // TODO: check what people did before that
            return;
        }
        guard let extras = extras else {
            youboraPlugin.options.contentIsLive = nil
            youboraPlugin.options.contentId = nil
            youboraPlugin.options.contentTitle = nil
            youboraPlugin.options.contentTvShow = nil
            youboraPlugin.options.contentSeason = nil
            youboraPlugin.options.contentEpisodeTitle = nil
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

    public func replaceCurrentMediaItem(_ mediaItem: MediaItem, autoplay: NSNumber?) {
        let playerItem = mapMediaItem(mediaItem);
        player.replaceCurrentItem(with: playerItem)
        
        temporaryStatusObserver = playerItem.observe(\.status, options: [.new, .old]) {
            (playerItem, change) in
            if (playerItem.status == .readyToPlay) {
                if let playbackStartPositionMs = mediaItem.playbackStartPositionMs {
                    playerItem.seek(to: CMTime(value: Int64(truncating: playbackStartPositionMs), timescale: 1000), completionHandler: nil)
                }
                if (autoplay?.boolValue == true) {
                    self.player.play()
                }
            } else if (playerItem.status == .failed || playerItem.status == .unknown) {
                print("Mediaitem failed to play")
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
//        if (playerViewController == pipController) {
//            pipController = nil
//        }
        playerViewController.player = player
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
                if let metadataItem = MetadataUtils.metadataItem(identifier: item.key, value: item.value as (NSCopying & NSObjectProtocol)?, namespace: .BccmExtras) {
                    allItems.append(metadataItem)
                }
            }
        }
        if let mimeType = mediaItem.mimeType {
            if let metadataItem = MetadataUtils.metadataItem(identifier: PlayerMetadataConstants.MimeType, value: mimeType as (NSCopying & NSObjectProtocol)?, namespace: .BccmPlayer) {
                allItems.append(metadataItem)
            }
        }

        if #available(iOS 12.2, *) {
            playerItem.externalMetadata.append(contentsOf: allItems)
        } else {
            // Fallback on earlier versions
        }
        
        return playerItem;
    }
    
    func addObservers() {
        // listening for current item change
        observers.append(player.observe(\.currentItem, options: [.old, .new]) {
            (player, _) in
            debugPrint("BTV DEBUG: media item changed...")
            let mediaItem = MediaItemUtils.mapPlayerItem(player.currentItem)
            let event = MediaItemTransitionEvent.make(withPlayerId: self.id, mediaItem: mediaItem)
            self.playbackListener.onMediaItemTransition(event, completion: { _ in })
            
            self.npawHandleMediaItemUpdate(playerItem: player.currentItem, extras: mediaItem?.metadata?.extras);
            
            self.observers.append(player.observe(\.currentItem?.duration, options: [.old, .new]) {
                (player, change) in
                debugPrint("BTV DEBUG: duration..")
                MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPMediaItemPropertyPlaybackDuration] = player.currentItem?.duration.seconds
            })
        })
        self.observers.append(player.observe(\.rate, options: [.old, .new]) {
            (player, change) in
            debugPrint("BTV DEBUG: duration..")
            let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
            nowPlayingInfoCenter.nowPlayingInfo?[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player.currentTime().seconds
        })
        observers.append(player.observe(\.timeControlStatus, options: [.old, .new]) {
            (player, change) in
            debugPrint("BTV DEBUG: player status changed...")
            
            print("bccm: audiosession playerstatuschanged outputDataSource: " + String(AVAudioSession.sharedInstance().outputDataSource?.dataSourceName ?? ""))
            print("bccm: audiosession playerstatuschanged sec: " + String(AVAudioSession.sharedInstance().secondaryAudioShouldBeSilencedHint))
            print("bccm: audiosession playerstatuschanged ioBufferDuration: " + String(AVAudioSession.sharedInstance().ioBufferDuration))
            print("bccm: audiosession playerstatuschanged mode: " + AVAudioSession.sharedInstance().mode.rawValue)
            print("bccm: audiosession playerstatuschanged debugDesc: " + AVAudioSession.sharedInstance().debugDescription)
            print("bccm: audiosession playerstatuschanged category: " + AVAudioSession.sharedInstance().category.rawValue)
            print("bccm: audiosession playerstatuschanged categoryoptions: " + String(AVAudioSession.sharedInstance().categoryOptions.rawValue))
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
