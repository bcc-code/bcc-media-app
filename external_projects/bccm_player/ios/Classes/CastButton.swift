//
//  CastButton.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 19/09/2022.
//

import Foundation
import Flutter
import UIKit
import AVKit
import GoogleCast

class CastButtonFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    private var playbackApi: PlaybackApiImpl

    init(messenger: FlutterBinaryMessenger, playbackApi: PlaybackApiImpl) {
        self.messenger = messenger
        self.playbackApi = playbackApi
        super.init()
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }

    func create(
            withFrame frame: CGRect,
            viewIdentifier viewId: Int64,
            arguments args: Any?
    ) -> FlutterPlatformView {
        return CastButton(
                frame: frame)
    }
}

class CastButton: NSObject, FlutterPlatformView {
    private var _view: UIView = UIView()

    init(
            frame: CGRect
    ) {
        _view.frame = frame
        super.init()

        // iOS views can be created here

        createNativeView(frame: frame, view: _view)
    }

    func view() -> UIView {
        return _view
    }

    deinit {

        //_playerController?.player?.pause()
    }

    func createNativeView(frame: CGRect, view _view: UIView) {
        let nativeLabel = UILabel()
        nativeLabel.text = "Native text from iOS"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)


        _view.addSubview(GCKUICastButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)))
    }
}
