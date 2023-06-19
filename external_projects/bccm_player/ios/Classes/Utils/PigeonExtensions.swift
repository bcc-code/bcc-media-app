//
//  PigeonExtensions.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 19/06/2023.
//

import AVKit
import Foundation

extension TrackType {
    func asAVMediaCharacteristic() -> AVMediaCharacteristic? {
        if self == .audio {
            return .audible
        } else if self == .text {
            return .legible
        } else {
            return nil
        }
    }
}
