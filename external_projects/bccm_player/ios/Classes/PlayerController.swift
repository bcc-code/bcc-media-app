//
//  PlayerController.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 19/09/2022.
//

import Foundation
import AVFoundation

public protocol PlayerController {
    var id: String { get }
    func updateNpawConfig(npawConfig: NpawConfig?)
    func setMediaItem(_ mediaItem: MediaItem)
    func queueItem(_ mediaItem: MediaItem)
    func play()
    func pause()
    func stop(reset: Bool)
}
extension PlayerController {
}
