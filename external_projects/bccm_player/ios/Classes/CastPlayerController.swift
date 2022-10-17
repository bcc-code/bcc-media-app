//
//  CastController.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 19/09/2022.
//

import Foundation
import AVFoundation
import GoogleCast

class CastPlayerController: NSObject, PlayerController  {
    private var playbackApi: PlaybackApiImpl?
    var id: String
    var chromecastPigeon: ChromecastPigeon
    var playbackListener: PlaybackListenerPigeon
    var castState: GCKCastState?
    var positionUponEndingSession: TimeInterval?
    var sessionManager: GCKSessionManager?
    final var observers = [NSKeyValueObservation]()
    
    init(chromecastPigeon: ChromecastPigeon, playbackListener: PlaybackListenerPigeon) {
        self.id = "chromecast"
        self.chromecastPigeon = chromecastPigeon
        self.playbackListener = playbackListener
        let castContext = GCKCastContext.sharedInstance();
        self.castState = castContext.castState
        super.init();
        
        NotificationCenter.default.addObserver(self, selector: #selector(castDeviceDidChange),
                                                   name: NSNotification.Name.gckCastStateDidChange,
                                                   object: GCKCastContext.sharedInstance())
//
//        observers.append(castContext.observe(\.sessionManager.currentSession, options: [.old, .new]) {
//            (castContext, change) in
//            castContext.sessionManager.currentSession?.remoteMediaClient?.add(self)
//        })
    }
    
    public func hasBecomePrimary() {
    }
    
    func setPlaybackApi(_ playbackApi: PlaybackApiImpl) {
        self.playbackApi = playbackApi;
    }
    

    @objc func castDeviceDidChange(_: Notification) {
      self.castState = GCKCastContext.sharedInstance().castState
    }
    
    func updateNpawConfig(npawConfig: NpawConfig?) {
        
    }
    
    func replaceCurrentMediaItem(_ mediaItem: MediaItem, autoplay: NSNumber?) {
        guard let mediaInfo = mapMediaItemToMediaInformation(mediaItem) else {
            fatalError("invalid url passed to setMediaItem");
        };
        GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.loadMedia(mediaInfo);
    }
    
    func queueItem(_ mediaItem: MediaItem) {
        guard let queueItem = mapMediaItemToQueueItem(mediaItem) else {
            return
        };
        
        GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.queueInsert(queueItem, beforeItemWithID: kGCKMediaQueueInvalidItemID);
    }
    
    func mapMediaItemToQueueItem(_ mediaItem: MediaItem) -> GCKMediaQueueItem? {
        guard let mediaInfo = mapMediaItemToMediaInformation(mediaItem) else {
            debugPrint("invalid or nil mediaItem passed to createQueueItem")
            return nil;
        };
        let isLive = mediaItem.isLive?.boolValue == true;
        let queueItemBuilder = GCKMediaQueueItemBuilder()
        queueItemBuilder.mediaInformation = mediaInfo;
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
        if (reset) {
            GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.mediaQueue.clear()
            GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.stop()
        } else {
            GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.pause()
        }
    }
    
    func mapMediaItemToMediaInformation(_ mediaItem: MediaItem) -> GCKMediaInformation? {
        guard let url = URL(string: mediaItem.url) else {
            return nil
        }
        let mediaInfoBuilder = GCKMediaInformationBuilder(contentURL: url);
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
                    let image = GCKImage.init(url: uri, width: 0, height: 0)
                    metadata.addImage(image)
                }
            }
            if let extras = originalMeta.extras {
                if let extrasJson = MetadataUtils.dictToJson(extras) {
                    playerData[PlayerMetadataConstants.ExtrasJson] = extrasJson
                }
            }
        }
        for kv in playerData {
            metadata.setString(kv.value, forKey: MetadataNamespace.BccmPlayer.rawValue + "." + kv.key)
        }
        
        mediaInfoBuilder.metadata = metadata;
        return mediaInfoBuilder.build();
    }
    
    func transferStateFromPrimary() {
        guard let player = (playbackApi?.getPrimaryPlayer() as? AVQueuePlayerController)?.getPlayer() else {
            debugPrint("No primary player");
            return;
        }
        guard let currentItem = player.currentItem else {
            debugPrint("No current item");
            return;
        }
        
        let currentItemIndex = player.items().firstIndex(of: currentItem) ?? 0
        
        var queue = [GCKMediaQueueItem]()
        let playerItems = Array(player.items().suffix(from: currentItemIndex))
        
        for playerItem in playerItems {
            guard let mediaItem = MediaItemUtils.mapPlayerItem(playerItem) else {
                continue
            }
            guard let queueItem = mapMediaItemToQueueItem(mediaItem) else {
                continue
            }
            
            queue.append(queueItem)
        }
        guard let remoteMediaClient = GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient else {
            return;
        }
        
        //remoteMediaClient.queueUpdate(queue, customData: nil)
        let queueBuilder = GCKMediaQueueDataBuilder(queueType: GCKMediaQueueType.videoPlayList);
        queueBuilder.items = queue;
        let loadRequestBuilder = GCKMediaLoadRequestDataBuilder();
        loadRequestBuilder.startTime = currentItem.currentTime().seconds
        loadRequestBuilder.queueData = queueBuilder.build()
        remoteMediaClient.loadMedia(with: loadRequestBuilder.build())
        player.removeAllItems()
        player.pause()
    }
   
    var metaTemp: GCKMediaMetadata? = nil
    
}

extension CastPlayerController : GCKRemoteMediaClientListener {
    func remoteMediaClient(_ client: GCKRemoteMediaClient, didUpdate mediaMetadata: GCKMediaMetadata?) {
        debugPrint("something didUpdate mediaMetadata:" + mediaMetadata.debugDescription)
        debugPrint("is metaTemp same?: " + (metaTemp == mediaMetadata).description)
        guard let mediaMetadata = mediaMetadata else {
            self.playbackListener.onMediaItemTransition(MediaItemTransitionEvent.make(withPlayerId: self.id, mediaItem: nil), completion: { e in })
            return;
        }
       
        let mappedMetadata = MediaMetadata();
        mappedMetadata.title = mediaMetadata.string(forKey: kGCKMetadataKeyTitle)
        if let image = mediaMetadata.images().first as? GCKImage {
            mappedMetadata.artworkUri = image.url.absoluteString
        }
        
        var playerData: [String: String] = [:]
        for metadataKey in mediaMetadata.allKeys() {
            guard let namespaceStringRange = metadataKey.range(of: MetadataNamespace.BccmPlayer.rawValue + ".") else {
                continue
            }
            let playerDataKey = String(metadataKey[namespaceStringRange.upperBound...]);
            playerData[playerDataKey] = mediaMetadata.string(forKey: metadataKey)
        }
        
        if let extrasJson = playerData[PlayerMetadataConstants.ExtrasJson]?.data(using: .utf8) {
            do {
                let decoded = try JSONSerialization.jsonObject(with: extrasJson, options: [])
                if let dictFromJSON = decoded as? [String:String] {
                    mappedMetadata.extras = dictFromJSON
                }
            } catch {
                print (error.localizedDescription)
            }
        }
        let mimeType = playerData[PlayerMetadataConstants.MimeType]
        let isLive = playerData[PlayerMetadataConstants.IsLive] == "true"
        debugPrint(mappedMetadata.extras as Any)
        debugPrint(playerData)
        let mediaItem = MediaItem.make(withUrl: "", mimeType: mimeType, metadata: mappedMetadata, isLive: isLive as NSNumber, playbackStartPositionMs: nil)
        let event = MediaItemTransitionEvent.make(withPlayerId: self.id, mediaItem: mediaItem)
        playbackListener.onMediaItemTransition(event, completion: { e in })
    }
    func remoteMediaClient(_ client: GCKRemoteMediaClient, didReceive queueItems: [GCKMediaQueueItem]) {
        debugPrint("something didReceive queueItems: " + queueItems.map { a in a.mediaInformation.metadata?.value(forKey: "title")}.debugDescription)
    }
    
    func remoteMediaClient(_ client: GCKRemoteMediaClient, didUpdate mediaStatus: GCKMediaStatus?) {
        metaTemp = mediaStatus?.currentQueueItem?.mediaInformation.metadata
        debugPrint("something didReceive mediaStatus: " + mediaStatus.debugDescription)
        debugPrint("mediaStatus meta: " + metaTemp.debugDescription)
        let isPlaying = (mediaStatus?.playerState != .paused && mediaStatus?.playerState != .unknown)
        let event = IsPlayingChangedEvent.make(withPlayerId: self.id, isPlaying: isPlaying as NSNumber)
        self.playbackListener.onIsPlayingChanged(event, completion: { _ in })
    }
    
}

extension CastPlayerController : GCKCastDeviceStatusListener {
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
//  func sessionManager(_: GCKSessionManager, didEnd _: GCKSession, withError error: Error?) {
//    if error == nil {
//      if let view = window?.rootViewController?.view {
//        Toast.displayMessage("Session ended", for: 3, in: view)
//      }
//    } else {
//      let message = "Session ended unexpectedly:\n\(error?.localizedDescription ?? "")"
//      showAlert(withTitle: "Session error", message: message)
//    }
//  }

    func sessionManager(_: GCKSessionManager, willEnd session: GCKSession) {
        positionUponEndingSession = session.remoteMediaClient?.approximateStreamPosition()
    }
    
    func sessionManager(_ sessionManager: GCKSessionManager, didSuspend session: GCKSession,
                        with reason: GCKConnectionSuspendReason) {
        chromecastPigeon.onSessionSuspended() { _ in }
        session.remoteMediaClient?.remove(self)
    }
    
    func sessionManager(_ sessionManager: GCKSessionManager, didResumeSession session: GCKSession) {
        chromecastPigeon.onSessionResumed() { _ in }
        transferStateFromPrimary()
        session.remoteMediaClient?.add(self)
    }
    
    func sessionManager(
        _ sessionManager: GCKSessionManager,
        didStart session: GCKCastSession
    ) {
        chromecastPigeon.onSessionStarted { _ in }
        transferStateFromPrimary()
        session.add(self)
        debugPrint("added session listener")
        self.sessionManager = sessionManager
        print ("currentCastSession.remotemediaclient nil? = " + (sessionManager.currentCastSession?.remoteMediaClient != nil).description)
        session.remoteMediaClient?.add(self)
    }
    func sessionManager(
        _ sessionManager: GCKSessionManager,
        didEnd session: GCKSession,
        withError error: Error?
    ) {
        chromecastPigeon.onSessionEnded { _ in }
        var positionMs: NSNumber? = nil
        if positionUponEndingSession != nil {
            positionMs = Int(positionUponEndingSession!*1000) as NSNumber
        }
        chromecastPigeon.onCastSessionUnavailable(CastSessionUnavailableEvent.make(withPlaybackPositionMs: positionMs)) { _ in }
        
        session.remoteMediaClient?.remove(self)
    }
}

