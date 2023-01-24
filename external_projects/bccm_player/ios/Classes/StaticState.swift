//
//  StaticState.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 24/01/2023.
//

import Foundation

@objc public class StaticState: NSObject {
    static public let shared: StaticState = StaticState()
    
    
    public var transitioningToFullscreen = false
}
