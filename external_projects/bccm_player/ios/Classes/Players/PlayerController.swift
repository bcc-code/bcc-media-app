//
//  PlayerController.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 19/09/2022.
//

import AVFoundation
import Foundation

public protocol PlayerController {
    var id: String { get }
    func setNpawConfig(npawConfig: NpawConfig?)
    func updateAppConfig(appConfig: AppConfig?)
    func getCurrentItem() -> MediaItem?
    func getPlayerTracksSnapshot() -> PlayerTracksSnapshot
    func setSelectedTrack(type: TrackType, trackId: String)
    func getPlayerStateSnapshot() -> PlayerStateSnapshot
    func replaceCurrentMediaItem(_ mediaItem: MediaItem, autoplay: NSNumber?, completion: @escaping (FlutterError?) -> ())
    func queueItem(_ mediaItem: MediaItem)
    func play()
    func seekTo(_ positionMs: NSNumber)
    func pause()
    func stop(reset: Bool)
    func exitFullscreen()
    func enterFullscreen()
    func hasBecomePrimary()
}
