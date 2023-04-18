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
    func updateNpawConfig(npawConfig: NpawConfig?)
    func updateAppConfig(appConfig: AppConfig?)
    func getCurrentItem() -> MediaItem?
    func replaceCurrentMediaItem(_ mediaItem: MediaItem, autoplay: NSNumber?, completion: @escaping (FlutterError?) -> ())
    func queueItem(_ mediaItem: MediaItem)
    func play()
    func pause()
    func stop(reset: Bool)
    func hasBecomePrimary()
}

extension PlayerController {}
