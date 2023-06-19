//
//  CastRequestDelegate.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 19/06/2023.
//

import Foundation
import GoogleCast

class SimpleGCKRequestDelegate: NSObject, GCKRequestDelegate {
    let didComplete: (() -> Void)?
    let didFailWithError: ((GCKError) -> Void)?
    let didAbort: ((GCKRequestAbortReason) -> Void)?

    init(didComplete: (() -> Void)?, didFailWithError: ((GCKError) -> Void)?, didAbort: ((GCKRequestAbortReason) -> Void)?) {
        self.didComplete = didComplete
        self.didFailWithError = didFailWithError
        self.didAbort = didAbort
    }

    func requestDidComplete(_ request: GCKRequest) {
        didComplete?()
    }

    func request(_ request: GCKRequest, didFailWithError error: GCKError) {
        didFailWithError?(error)
    }

    func request(_ request: GCKRequest, didAbortWith abortReason: GCKRequestAbortReason) {
        didAbort?(abortReason)
    }
}
