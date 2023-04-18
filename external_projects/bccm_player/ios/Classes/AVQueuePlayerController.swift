import AVFoundation
import AVKit
import Foundation
import MediaPlayer
import YouboraAVPlayerAdapter
import YouboraLib

public class AVQueuePlayerController: NSObject, PlayerController, AVPlayerViewControllerDelegate {
    lazy var player: AVQueuePlayer = .init()
    public final let id: String
    final let playbackListener: PlaybackListenerPigeon
    final var observers = [NSKeyValueObservation]()
    var temporaryStatusObserver: NSKeyValueObservation? = nil
    var youboraPlugin: YBPlugin
    var pipController: AVPlayerViewController? = nil
    var appConfig: AppConfig? = nil
    var refreshStateTimer: Timer? = nil

    init(id: String? = nil, playbackListener: PlaybackListenerPigeon, npawConfig: NpawConfig?, appConfig: AppConfig?) {
        self.id = id ?? UUID().uuidString
        self.playbackListener = playbackListener
        
        let youboraOptions = YBOptions()
        youboraOptions.enabled = npawConfig != nil
        youboraOptions.accountCode = npawConfig?.accountCode
        youboraOptions.appName = npawConfig?.appName
        youboraOptions.autoDetectBackground = false
        youboraOptions.appReleaseVersion = npawConfig?.appReleaseVersion
        youboraPlugin = YBPlugin(options: youboraOptions)
        super.init()
        updateAppConfig(appConfig: appConfig)
        youboraPlugin.adapter = YBAVPlayerAdapterSwiftTranformer.transform(from: YBAVPlayerAdapter(player: player))
        addObservers()
        refreshStateTimer = Timer.scheduledTimer(withTimeInterval: 15, repeats: true) { _ in
            let playerState = PlayerState.make(
                withPlayerId: self.id,
                isPlaying: self.isPlaying() as NSNumber,
                playbackPositionMs: NSNumber(value: self.player.currentTime().seconds * 1000))
            playbackListener.onPlayerStateUpdate(playerState, completion: { _ in })
        }
        print("BTV DEBUG: end of init playerController")
    }
    
    deinit {
        refreshStateTimer?.invalidate()
    }
    
    public func getCurrentItem() -> MediaItem? {
        return MediaItemUtils.mapPlayerItem(player.currentItem)
    }
    
    public func hasBecomePrimary() {
        setupCommandCenter()
    }
    
    public func play() {
        player.play()
    }
    
    public func pause() {
        player.pause()
    }
    
    public func stop(reset: Bool) {
        if reset {
            player.removeAllItems()
        } else {
            player.pause()
        }
    }
    
    public func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("bccm: audiosession category willstart: " + AVAudioSession.sharedInstance().category.rawValue)
        registerPipController(playerViewController)
    }
    
    public func playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart(_ playerViewController: AVPlayerViewController) -> Bool {
        print("playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart")
        return false
    }
    
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
    
    func registerPipController(_ playerView: AVPlayerViewController?) {
        pipController = playerView
        let event = PictureInPictureModeChangedEvent.make(withPlayerId: id, isInPipMode: (playerView != nil) as NSNumber)
        playbackListener.onPicture(inPictureModeChanged: event, completion: { _ in })
    }
    
    func releasePlayerView(_ playerView: AVPlayerViewController) {
        if playerView != pipController {
            print("releasing")
            playerView.player = nil
        }
    }
    
    func setupCommandCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.playCommand.addTarget { [weak self] _ -> MPRemoteCommandHandlerStatus in
            self?.player.play()
            return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] _ -> MPRemoteCommandHandlerStatus in
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
    
    func npawHandleMediaItemUpdate(mediaItem: MediaItem?) {
        guard let mediaItem = mediaItem else {
            youboraPlugin.options.contentIsLive = nil
            youboraPlugin.options.contentId = nil
            youboraPlugin.options.contentTitle = nil
            youboraPlugin.options.contentTvShow = nil
            youboraPlugin.options.contentSeason = nil
            youboraPlugin.options.contentEpisodeTitle = nil
            return
        }
        let extras = mediaItem.metadata?.extras
        let isLive = ((extras?["npaw.content.isLive"] as? String) == "true") || (mediaItem.isLive?.boolValue) == true
        youboraPlugin.options.contentIsLive = isLive as NSValue?
        youboraPlugin.options.contentId = extras?["npaw.content.id"] as? String ?? extras?["id"] as? String
        youboraPlugin.options.contentTitle = extras?["npaw.content.title"] as? String ?? mediaItem.metadata?.title
        youboraPlugin.options.contentTvShow = extras?["npaw.content.tvShow"] as? String
        youboraPlugin.options.contentSeason = extras?["npaw.content.season"] as? String
        youboraPlugin.options.contentEpisodeTitle = extras?["npaw.content.episodeTitle"] as? String
    }

    public func updateNpawConfig(npawConfig: NpawConfig?) {
        youboraPlugin.options.enabled = npawConfig != nil
        youboraPlugin.options.accountCode = npawConfig?.accountCode
        youboraPlugin.options.appName = npawConfig?.appName
        youboraPlugin.options.appReleaseVersion = npawConfig?.appReleaseVersion
    }

    public func updateAppConfig(appConfig: AppConfig?) {
        self.appConfig = appConfig
        youboraPlugin.options.username = appConfig?.analyticsId
        youboraPlugin.options.contentCustomDimension1 = appConfig?.sessionId != nil ? appConfig?.sessionId?.stringValue : nil
    }
    
    public func replaceCurrentMediaItem(_ mediaItem: MediaItem, autoplay: NSNumber?, completion: @escaping (FlutterError?) -> Void) {
        createPlayerItem(mediaItem) { playerItem in
            guard let playerItem = playerItem else {
                return
            }
            self.npawHandleMediaItemUpdate(mediaItem: mediaItem)
            DispatchQueue.main.async {
                self.player.replaceCurrentItem(with: playerItem)
                self.temporaryStatusObserver = playerItem.observe(\.status, options: [.new, .old]) {
                    playerItem, _ in
                    if playerItem.status == .readyToPlay {
                        if let playbackStartPositionMs = mediaItem.playbackStartPositionMs {
                            playerItem.seek(to: CMTime(value: Int64(truncating: playbackStartPositionMs), timescale: 1000), completionHandler: nil)
                        }
                        if autoplay?.boolValue == true {
                            self.player.play()
                        }
                        if let audioLanguage = self.appConfig?.audioLanguage {
                            _ = playerItem.setAudioLanguage(audioLanguage)
                        }
                        if let subtitleLanguage = self.appConfig?.subtitleLanguage {
                            _ = playerItem.setSubtitleLanguage(subtitleLanguage)
                        }
                        
                        // This is the initial signal. If this is not set the language is generally empty in NPAW
                        self.youboraPlugin.options.contentSubtitles = self.player.currentItem?.getSelectedSubtitleLanguage()
                        self.youboraPlugin.options.contentLanguage = self.player.currentItem?.getSelectedAudioLanguage()
                        
                        completion(nil)
                    } else if playerItem.status == .failed || playerItem.status == .unknown {
                        print("Mediaitem failed to play")
                        completion(FlutterError(code: "", message: "MediaItem failed to load", details: ["playerItem.status", playerItem.status.rawValue]))
                    }
                    self.temporaryStatusObserver?.invalidate()
                    self.temporaryStatusObserver = nil
                }
            }
        }
    }
    
    public func getPlayer() -> AVQueuePlayer {
        return player
    }

    public func queueItem(_ mediaItem: MediaItem) {
        createPlayerItem(mediaItem) { playerItem in
            guard let playerItem = playerItem else {
                return
            }
            DispatchQueue.main.async {
                self.player.insert(playerItem, after: nil)
            }
        }
    }
    
    func takeOwnership(_ playerViewController: AVPlayerViewController) {
//        if (playerViewController == pipController) {
//            pipController = nil
//        }
        playerViewController.player = player
    }
    
    func createPlayerItem(_ mediaItem: MediaItem, _ completion: @escaping (AVPlayerItem?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let urlString = mediaItem.url, let url = URL(string: urlString) else {
                return completion(nil)
            }
            let asset = AVURLAsset(url: url)
            
            asset.loadValuesAsynchronously(forKeys: ["playable", "duration", "tracks"]) {
                let playerItem = self._createPlayerItem(mediaItem, asset)
                completion(playerItem)
            }
        }
    }
    
    private func _createPlayerItem(_ mediaItem: MediaItem, _ asset: AVAsset) -> AVPlayerItem? {
        let playerItem = AVPlayerItem(asset: asset)
        if #available(iOS 12.2, *) {
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
                                var externalMetadata = playerItem.externalMetadata
                                externalMetadata.append(artworkItem)
                                playerItem.externalMetadata = externalMetadata
                            }
                        }
                    }
                    if let artworkUriMeta = MetadataUtils.metadataItem(identifier: PlayerMetadataConstants.ArtworkUri, value: artworkUri as (NSCopying & NSObjectProtocol)?, namespace: .BccmPlayer) {
                        playerItem.externalMetadata.append(artworkUriMeta)
                    }
                }
            }
            if let extras = mediaItem.metadata?.extras {
                for item in extras {
                    if let value = item.value as? (NSCopying & NSObjectProtocol)?,
                       let metadataItem = MetadataUtils.metadataItem(identifier: item.key, value: value, namespace: .BccmExtras)
                    {
                        allItems.append(metadataItem)
                    }
                }
            }
            if let mimeType = mediaItem.mimeType {
                if let metadataItem = MetadataUtils.metadataItem(identifier: PlayerMetadataConstants.MimeType, value: mimeType as (NSCopying & NSObjectProtocol)?, namespace: .BccmPlayer) {
                    allItems.append(metadataItem)
                }
            }
            
            playerItem.externalMetadata.append(contentsOf: allItems)
        }
        return playerItem
    }

    func addObservers() {
        // listening for current item change
        observers.append(player.observe(\.currentItem, options: [.old, .new]) {
            player, _ in
            let mediaItem = MediaItemUtils.mapPlayerItem(player.currentItem)
            let event = MediaItemTransitionEvent.make(withPlayerId: self.id, mediaItem: mediaItem)
            self.playbackListener.onMediaItemTransition(event, completion: { _ in })
            
            self.npawHandleMediaItemUpdate(mediaItem: mediaItem)
            
            self.observers.append(player.observe(\.currentItem?.duration, options: [.old, .new]) {
                player, _ in
                MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPMediaItemPropertyPlaybackDuration] = player.currentItem?.duration.seconds
            })
            
            self.observers.append(player.observe(\.currentItem?.currentMediaSelection, options: [.old, .new]) {
                player, _ in
                // Update language in NPAW
                self.youboraPlugin.options.contentLanguage = player.currentItem?.getSelectedAudioLanguage()
                self.youboraPlugin.options.contentSubtitles = player.currentItem?.getSelectedSubtitleLanguage()
            })
        })
        observers.append(player.observe(\.rate, options: [.old, .new]) {
            player, change in
            debugPrint("change observed: rate")
            let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
            nowPlayingInfoCenter.nowPlayingInfo?[MPNowPlayingInfoPropertyPlaybackRate] = change.newValue
            nowPlayingInfoCenter.nowPlayingInfo?[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player.currentTime().seconds
            let positionDiscontinuityEvent = PositionDiscontinuityEvent.make(withPlayerId: self.id, playbackPositionMs: (player.currentTime().seconds * 1000).rounded() as NSNumber)
            self.playbackListener.onPositionDiscontinuity(positionDiscontinuityEvent, completion: { _ in })
        })
        observers.append(player.observe(\.timeControlStatus, options: [.old, .new]) {
            player, _ in
            debugPrint("change observed: timeControlStatus")
            let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
            nowPlayingInfoCenter.nowPlayingInfo?[MPNowPlayingInfoPropertyPlaybackRate] = player.rate
            nowPlayingInfoCenter.nowPlayingInfo?[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player.currentTime().seconds
            let isPlayingEvent = IsPlayingChangedEvent.make(withPlayerId: self.id, isPlaying: self.isPlaying() as NSNumber)
            self.playbackListener.onIsPlayingChanged(isPlayingEvent, completion: { _ in })
            let positionDiscontinuityEvent = PositionDiscontinuityEvent.make(withPlayerId: self.id, playbackPositionMs: (player.currentTime().seconds * 1000).rounded() as NSNumber)
            self.playbackListener.onPositionDiscontinuity(positionDiscontinuityEvent, completion: { _ in })
        })
    }
    
    func isPlaying() -> Bool {
        // We don't want "isPlaying" to be affected by buffering
        // So we only check if the player is paused or doesnt have an item to play.
        let paused = player.timeControlStatus == AVPlayer.TimeControlStatus.paused
        let waitingBecauseNoItemToPlay = player.timeControlStatus == AVPlayer.TimeControlStatus.waitingToPlayAtSpecifiedRate
            && player.reasonForWaitingToPlay == AVPlayer.WaitingReason.noItemToPlay
        return !paused && !waitingBecauseNoItemToPlay
    }
}

extension AVPlayerItem {
    func setAudioLanguage(_ audioLanguage: String) -> Bool {
        if let group = asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.audible) {
            let locale = Locale(identifier: audioLanguage)
            let options = AVMediaSelectionGroup.mediaSelectionOptions(from: group.options, with: locale)
            if let option = options.first {
                select(option, in: group)
                return true
            }
        }
        return false
    }

    func setSubtitleLanguage(_ subtitleLanguage: String) -> Bool {
        if let group = asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.legible) {
            let locale = Locale(identifier: subtitleLanguage)
            let options = AVMediaSelectionGroup.mediaSelectionOptions(from: group.options, with: locale)
            if let option = options.first {
                select(option, in: group)
                return true
            }
        }
        return false
    }
    
    func getSelectedAudioLanguage() -> String? {
        if let group = asset.mediaSelectionGroup(forMediaCharacteristic: .audible),
           let selectedOption = currentMediaSelection.selectedMediaOption(in: group),
           let languageCode = selectedOption.extendedLanguageTag
        {
            return languageCode
        }
        
        return nil
    }
    
    func getSelectedSubtitleLanguage() -> String? {
        if let group = asset.mediaSelectionGroup(forMediaCharacteristic: .legible),
           let selectedOption = currentMediaSelection.selectedMediaOption(in: group),
           let languageCode = selectedOption.extendedLanguageTag
        {
            return languageCode
        }
        
        return nil
    }
}
