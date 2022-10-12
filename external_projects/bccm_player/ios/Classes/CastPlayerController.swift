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
        guard let mediaInfo = mapMediaItem(mediaItem) else {
            fatalError("invalid url passed to setMediaItem");
        };
        GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.loadMedia(mediaInfo);
    }
    
    func queueItem(_ mediaItem: MediaItem) {
        guard let mediaInfo = mapMediaItem(mediaItem) else {
            fatalError("invalid url passed to setMediaItem");
        };
        let queueItemBuilder = GCKMediaQueueItemBuilder()
        queueItemBuilder.mediaInformation = mediaInfo;
        GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient?.queueInsert(queueItemBuilder.build(), beforeItemWithID: kGCKMediaQueueInvalidItemID);
    }
    
    func play() {
        
    }
    
    func pause() {
        
    }
    
    func stop(reset: Bool) {
        
    }
    
    func mapMediaItem(_ mediaItem: MediaItem) -> GCKMediaInformation? {
        guard let url = URL(string: mediaItem.url) else {
            return nil
        }
        let mediaInfoBuilder = GCKMediaInformationBuilder(contentURL: url);
        let metadata = GCKMediaMetadata()
        if let originalMeta = mediaItem.metadata {
            if let artworkUriString = originalMeta.artworkUri {
                if let artworkUri = URL(string: artworkUriString) {
                    metadata.addImage(GCKImage.init(url: artworkUri, width: 480, height: 720))
                }
            }
            if let title = originalMeta.title {
                metadata.setString(title, forKey: kGCKMetadataKeyTitle)
            }
            if let description = originalMeta.artist {
                metadata.setString(description, forKey: kGCKMetadataKeyArtist)
            }
        }
        
        mediaInfoBuilder.metadata = metadata;
        
        return mediaInfoBuilder.build();
    }
    
    func transferStateFromPrimary() {
        guard let player = (playbackApi?.getPrimaryPlayer() as? AVQueuePlayerController)?.getPlayer() else {
            debugPrint("No primary player");
            return;
        }
        var queue = [GCKMediaQueueItem]()
        for playerItem in player.items() {
            guard let urlString = (playerItem.asset as? AVURLAsset)?.url.absoluteString else {
                continue;
            }
            guard let url = URL(string: urlString) else {
                continue;
            }
            
            let infoBuilder = GCKMediaInformationBuilder(contentURL: url);
            infoBuilder.contentType = "application/x-mpegURL"
            
            let queueItemBuilder = GCKMediaQueueItemBuilder()
            queueItemBuilder.mediaInformation = infoBuilder.build();
            queueItemBuilder.startTime = playerItem.currentTime().seconds
            
            queue.append(queueItemBuilder.build())
        }
        guard let remoteMediaClient = GCKCastContext.sharedInstance().sessionManager.currentCastSession?.remoteMediaClient else {
            return;
        }
        
        //remoteMediaClient.queueUpdate(queue, customData: nil)
        let builder = GCKMediaLoadRequestDataBuilder();
        let queueBuilder = GCKMediaQueueDataBuilder(queueType: GCKMediaQueueType.videoPlayList);
        queueBuilder.items = queue;
        
        if let currentItem = player.currentItem {
            if let currentItemIndex = player.items().firstIndex(of: currentItem) {
                queueBuilder.startIndex = UInt(currentItemIndex)
                builder.startTime = currentItem.currentTime().seconds
            }
        }
        builder.queueData = queueBuilder.build()
        remoteMediaClient.loadMedia(with: builder.build())
    }
   
    
}

extension CastPlayerController : GCKRemoteMediaClientListener {
    func remoteMediaClient(_ client: GCKRemoteMediaClient, didUpdate mediaMetadata: GCKMediaMetadata?) {
        debugPrint("something didUpdate mediaMetadata:" + mediaMetadata.debugDescription)
        guard mediaMetadata != nil else {
            self.playbackListener.onMediaItemTransition(MediaItemTransitionEvent.make(withPlayerId: "chromecast", mediaItem: nil), completion: { e in })
            return;
        }
       
        let mappedMetadata = MediaMetadata();
        mappedMetadata.title = mediaMetadata?.string(forKey: kGCKMetadataKeyTitle)
        let mediaItem = MediaItem.make(withUrl: "", mimeType: nil, metadata: mappedMetadata, isLive: nil, playbackStartPositionMs: nil)
        let meta = MediaItemTransitionEvent.make(withPlayerId: "chromecast", mediaItem: mediaItem)
        playbackListener.onMediaItemTransition(meta, completion: { e in })
    }
    func remoteMediaClient(_ client: GCKRemoteMediaClient, didReceive queueItems: [GCKMediaQueueItem]) {
        debugPrint("something didReceive queueItems: " + queueItems.map { a in a.mediaInformation.metadata?.value(forKey: "title")}.debugDescription)
    }
    
    func remoteMediaClient(_ client: GCKRemoteMediaClient, didUpdate mediaStatus: GCKMediaStatus?) {
        debugPrint("something didReceive mediaStatus: " + mediaStatus.debugDescription)
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

