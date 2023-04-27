import AVFoundation
import Foundation
import GoogleCast

class CastPlayerController: NSObject, PlayerController {
    static let DEFAULT_ID = "chromecast"
    var id: String
    var playbackApi: PlaybackApiImpl
    var castState: GCKCastState?
    var positionUponEndingSession: TimeInterval?
    var sessionManager: GCKSessionManager?
    var appConfig: AppConfig? = nil
    final var observers = [NSKeyValueObservation]()
    
    init(playbackApi: PlaybackApiImpl) {
        self.id = CastPlayerController.DEFAULT_ID
        self.playbackApi = playbackApi
        let castContext = GCKCastContext.sharedInstance()
        self.castState = castContext.castState
        super.init()
        GCKCastContext.sharedInstance().sessionManager.add(self)
        NotificationCenter.default.addObserver(self, selector: #selector(castDeviceDidChange),
                                               name: NSNotification.Name.gckCastStateDidChange,
                                               object: GCKCastContext.sharedInstance())
    }
    
    public func hasBecomePrimary() {}
    
    public func getPlayerStateSnapshot() -> PlayerStateSnapshot {
        let mediaStatus = GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.mediaStatus
        let currentItem = getCurrentItem()
        return PlayerStateSnapshot.make(
            withPlayerId: id,
            playbackState: playbackStateFromMediaStatus(mediaStatus: mediaStatus),
            currentMediaItem: currentItem,
            playbackPositionMs: mediaStatus == nil ? nil : NSNumber(value: mediaStatus!.streamPosition * 1000)
        )
    }
    
    func getCurrentItem() -> MediaItem? {
        if let currentItem = GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.mediaStatus?.currentQueueItem {
            return mapMediaQueueItem(currentItem)
        }
        return nil
    }
    
    func setPlaybackApi(_ playbackApi: PlaybackApiImpl) {
        self.playbackApi = playbackApi
    }
    
    @objc func castDeviceDidChange(_: Notification) {
        castState = GCKCastContext.sharedInstance().castState
    }
    
    func updateNpawConfig(npawConfig: NpawConfig?) {}
    
    func updateAppConfig(appConfig: AppConfig?) {
        self.appConfig = appConfig
    }
    
    func replaceCurrentMediaItem(_ mediaItem: MediaItem, autoplay: NSNumber?, completion: @escaping (FlutterError?) -> Void) {
        guard let mediaInfo = mapMediaItemToMediaInformation(mediaItem) else {
            fatalError("invalid url passed to setMediaItem")
        }
        GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.loadMedia(mediaInfo)
    }
    
    func queueItem(_ mediaItem: MediaItem) {
        guard let queueItem = mapMediaItemToQueueItem(mediaItem) else {
            return
        }
        
        GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.queueInsert(queueItem, beforeItemWithID: kGCKMediaQueueInvalidItemID)
    }
    
    func mapMediaItemToQueueItem(_ mediaItem: MediaItem) -> GCKMediaQueueItem? {
        guard let mediaInfo = mapMediaItemToMediaInformation(mediaItem) else {
            debugPrint("invalid or nil mediaItem passed to createQueueItem")
            return nil
        }
        let isLive = mediaItem.isLive?.boolValue == true
        let queueItemBuilder = GCKMediaQueueItemBuilder()
        queueItemBuilder.mediaInformation = mediaInfo
        queueItemBuilder.startTime = mediaItem.playbackStartPositionMs == nil || isLive ? kGCKInvalidTimeInterval : (Double(truncating: mediaItem.playbackStartPositionMs!) / 1000)
        return queueItemBuilder.build()
    }
    
    func play() {
        GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.play()
    }
    
    func pause() {
        GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.pause()
    }
    
    func stop(reset: Bool) {
        if reset {
            GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.mediaQueue.clear()
            GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.stop()
        } else {
            GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.pause()
        }
    }
    
    private func playbackStateFromMediaStatus(mediaStatus: GCKMediaStatus?) -> PlaybackState {
        if mediaStatus == nil {
            return PlaybackState.stopped
        }
        if mediaStatus!.playerState == .paused {
            return PlaybackState.paused
        }
        return PlaybackState.playing
    }
    
    func mapMediaItemToMediaInformation(_ mediaItem: MediaItem) -> GCKMediaInformation? {
        guard let urlString = mediaItem.url, let url = URL(string: urlString) else {
            return nil
        }
        let mediaInfoBuilder = GCKMediaInformationBuilder(contentURL: url)
        var playerData: [String: String] = [:]
        if mediaItem.isLive?.boolValue == true {
            mediaInfoBuilder.streamType = .live
            playerData[PlayerMetadataConstants.IsLive] = "true"
        }
        
        if let mimeType = mediaItem.mimeType {
            mediaInfoBuilder.contentType = mimeType
        }
        
        let metadata = GCKMediaMetadata()
        if let originalMeta = mediaItem.metadata {
            if let title = originalMeta.title {
                metadata.setString(title, forKey: kGCKMetadataKeyTitle)
            }
            if let description = originalMeta.artist {
                metadata.setString(description, forKey: kGCKMetadataKeyArtist)
            }
            if let artworkUri = originalMeta.artworkUri {
                if let uri = URL(string: artworkUri) {
                    let image = GCKImage(url: uri, width: 0, height: 0)
                    metadata.addImage(image)
                }
            }
            if let extras = originalMeta.extras {
                for kv in extras {
                    if let value = kv.value as? String {
                        metadata.setString(value, forKey: MetadataNamespace.BccmExtras.rawValue + "." + kv.key)
                    } else {
                        debugPrint("error! Value is not string")
                    }
                }
            }
        }
        for kv in playerData {
            metadata.setString(kv.value, forKey: MetadataNamespace.BccmPlayer.rawValue + "." + kv.key)
        }
        
        var customData: [String: Any] = [:]
        var audioTracks = [String]()
        var subtitlesTracks = [String]()
        if let lang = mediaItem.lastKnownAudioLanguage {
            audioTracks.append(lang)
        }
        if let lang = mediaItem.lastKnownSubtitleLanguage {
            subtitlesTracks.append(lang)
        }
        if let lang = appConfig?.audioLanguage {
            audioTracks.append(lang)
        }
        if let lang = appConfig?.subtitleLanguage {
            subtitlesTracks.append(lang)
        }
        customData["audioTracks"] = audioTracks
        customData["subtitlesTracks"] = subtitlesTracks
        
        mediaInfoBuilder.customData = customData
        mediaInfoBuilder.metadata = metadata
        return mediaInfoBuilder.build()
    }
    
    func transferStateFromPrimary() {
        guard let player = (playbackApi.getPrimaryPlayer() as? AVQueuePlayerController)?.getPlayer() else {
            debugPrint("No primary player")
            return
        }
        guard let currentItem = player.currentItem else {
            debugPrint("No current item")
            return
        }
        
        let currentItemIndex = player.items().firstIndex(of: currentItem) ?? 0
        
        var queue = [GCKMediaQueueItem]()
        let playerItems = Array(player.items().suffix(from: currentItemIndex))
        
        for playerItem in playerItems {
            guard let mediaItem = MediaItemMapper.mapPlayerItem(playerItem) else {
                continue
            }
            guard let queueItem = mapMediaItemToQueueItem(mediaItem) else {
                continue
            }
            
            queue.append(queueItem)
        }
        guard let remoteMediaClient = GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient else {
            return
        }
        
        let queueBuilder = GCKMediaQueueDataBuilder(queueType: GCKMediaQueueType.videoPlayList)
        queueBuilder.items = queue
        let loadRequestBuilder = GCKMediaLoadRequestDataBuilder()
        loadRequestBuilder.startTime = currentItem.currentTime().seconds
        loadRequestBuilder.queueData = queueBuilder.build()
        remoteMediaClient.loadMedia(with: loadRequestBuilder.build())
        player.removeAllItems()
        player.pause()
        playbackApi.setPrimary(id, completion: { _ in })
    }
    
    func mapMediaQueueItem(_ mediaQueueItem: GCKMediaQueueItem?) -> MediaItem? {
        guard let mediaQueueItem = mediaQueueItem else {
            return nil
        }
        guard let mediaItem = mapMediaMetadata(mediaQueueItem.mediaInformation.metadata) else {
            return nil
        }
        mediaItem.url = mediaQueueItem.mediaInformation.contentURL?.absoluteString
        return mediaItem
    }
    
    func mapMediaMetadata(_ mediaMetadata: GCKMediaMetadata?) -> MediaItem? {
        guard let mediaMetadata = mediaMetadata else {
            return nil
        }
       
        let mappedMetadata = MediaMetadata()
        mappedMetadata.title = mediaMetadata.string(forKey: kGCKMetadataKeyTitle)
        if let image = mediaMetadata.images().first as? GCKImage {
            mappedMetadata.artworkUri = image.url.absoluteString
        }
        
        var playerData: [String: String] = [:]
        for metadataKey in mediaMetadata.allKeys() {
            guard let namespaceStringRange = metadataKey.range(of: MetadataNamespace.BccmPlayer.rawValue + ".") else {
                continue
            }
            let playerDataKey = String(metadataKey[namespaceStringRange.upperBound...])
            playerData[playerDataKey] = mediaMetadata.string(forKey: metadataKey)
        }
        
        var extras: [String: String] = [:]
        for metadataKey in mediaMetadata.allKeys() {
            guard let namespaceStringRange = metadataKey.range(of: MetadataNamespace.BccmExtras.rawValue + ".") else {
                continue
            }
            let extrasKey = String(metadataKey[namespaceStringRange.upperBound...])
            extras[extrasKey] = mediaMetadata.string(forKey: metadataKey)
        }
        mappedMetadata.extras = extras
        
        let mimeType = playerData[PlayerMetadataConstants.MimeType]
        let isLive = playerData[PlayerMetadataConstants.IsLive] == "true"
        debugPrint(mappedMetadata.extras as Any)
        debugPrint(playerData)
        let mediaItem = MediaItem.make(
            withUrl: "",
            mimeType: mimeType,
            metadata: mappedMetadata,
            isLive: isLive as NSNumber,
            playbackStartPositionMs: nil,
            lastKnownAudioLanguage: nil,
            lastKnownSubtitleLanguage: nil
        )
        
        return mediaItem
    }
   
    var metaTemp: GCKMediaMetadata? = nil
}

extension CastPlayerController: GCKRemoteMediaClientListener {
    func remoteMediaClient(_ client: GCKRemoteMediaClient, didUpdate mediaMetadata: GCKMediaMetadata?) {
        debugPrint("something didUpdate mediaMetadata:" + mediaMetadata.debugDescription)
        debugPrint("is metaTemp same?: " + (metaTemp == mediaMetadata).description)
        guard let mediaItem = mapMediaMetadata(mediaMetadata) else {
            playbackApi.playbackListener.onMediaItemTransition(MediaItemTransitionEvent.make(withPlayerId: id, mediaItem: nil), completion: { _ in })
            return
        }
        let event = MediaItemTransitionEvent.make(withPlayerId: id, mediaItem: mediaItem)
        playbackApi.playbackListener.onMediaItemTransition(event, completion: { _ in })
    }

    func remoteMediaClient(_ client: GCKRemoteMediaClient, didReceive queueItems: [GCKMediaQueueItem]) {
        debugPrint("something didReceive queueItems: " + queueItems.map { a in a.mediaInformation.metadata?.value(forKey: "title") }.debugDescription)
    }
    
    func remoteMediaClient(_ client: GCKRemoteMediaClient, didUpdate mediaStatus: GCKMediaStatus?) {
        metaTemp = mediaStatus?.currentQueueItem?.mediaInformation.metadata
        debugPrint("something didReceive mediaStatus: " + mediaStatus.debugDescription)
        debugPrint("mediaStatus meta: " + metaTemp.debugDescription)
        let event = PlaybackStateChangedEvent.make(withPlayerId: id, playbackState: playbackStateFromMediaStatus(mediaStatus: mediaStatus))
        playbackApi.playbackListener.onPlaybackStateChanged(event, completion: { _ in })
    }
}

extension CastPlayerController: GCKCastDeviceStatusListener {
    func castSession(_ castSession: GCKCastSession, didUpdate device: GCKMultizoneDevice) {
        debugPrint("didReceive didUpdate device")
    }

    func castSession(_ castSession: GCKCastSession, didReceive standbyStatus: GCKStandbyStatus) {
        debugPrint("didReceive standbyStatus")
    }

    func castSession(_ castSession: GCKCastSession, didReceive multizoneStatus: GCKMultizoneStatus) {
        debugPrint("didReceive multizoneStatus")
    }

    func castSession(_ castSession: GCKCastSession, didReceive activeInputStatus: GCKActiveInputStatus) {
        debugPrint("didReceive activeInputStatus")
        castSession.add(self)
    }
}

// MARK: - GCKSessionManagerListener

extension CastPlayerController: GCKSessionManagerListener {
    func sessionManager(_: GCKSessionManager, willEnd session: GCKSession) {
        debugPrint("CastPlayerController::sessionManager(willEnd)")
        positionUponEndingSession = session.remoteMediaClient?.approximateStreamPosition()
    }
    
    func sessionManager(_ sessionManager: GCKSessionManager, didSuspend session: GCKSession,
                        with reason: GCKConnectionSuspendReason)
    {
        debugPrint("CastPlayerController::sessionManager(didSuspend)")
        session.remoteMediaClient?.remove(self)
        playbackApi.chromecastPigeon.onSessionSuspended { _ in }
    }
    
    func sessionManager(_ sessionManager: GCKSessionManager, didResumeSession session: GCKSession) {
        debugPrint("CastPlayerController::sessionManager(didResume)")
        playbackApi.setPrimary(id, completion: { _ in })
        session.remoteMediaClient?.add(self)
        playbackApi.chromecastPigeon.onSessionResumed { _ in }
    }
    
    func sessionManager(
        _ sessionManager: GCKSessionManager,
        didStart session: GCKCastSession
    ) {
        debugPrint("CastPlayerController::sessionManager(didStart)")
        transferStateFromPrimary()
        session.add(self)
        self.sessionManager = sessionManager
        session.remoteMediaClient?.add(self)
        playbackApi.chromecastPigeon.onSessionStarted { _ in }
    }

    func sessionManager(
        _ sessionManager: GCKSessionManager,
        didEnd session: GCKSession,
        withError error: Error?
    ) {
        debugPrint("CastPlayerController::sessionManager(didEnd)")
        var positionMs: NSNumber? = nil
        if positionUponEndingSession != nil {
            positionMs = Int(positionUponEndingSession! * 1000) as NSNumber
        }
        playbackApi.unclaimIfPrimary(id)
        session.remoteMediaClient?.remove(self)
        playbackApi.chromecastPigeon.onSessionEnded { _ in }
        playbackApi.chromecastPigeon.onCastSessionUnavailable(CastSessionUnavailableEvent.make(withPlaybackPositionMs: positionMs)) { _ in }
    }
}
