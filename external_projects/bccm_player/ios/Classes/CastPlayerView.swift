//
//  CastPlayerView.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 19/09/2022.
//

import Foundation
import GoogleCast


class CastPlayerViewFactory: NSObject, FlutterPlatformViewFactory {
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
        let argDictionary = args as! [String: Any]?
        let playerController = playbackApi.getPlayer(CastPlayerController.DEFAULT_ID)
        guard let pc = playerController as? CastPlayerController else {
            fatalError("Playercontroller is of unknown type.");
        }
        return CastPlayerView(frame: frame, playerController: pc);
        
    }
}

class CastPlayerView: NSObject, FlutterPlatformView {
    private var _view: UIView = UIView()
    private var _playerController: CastPlayerController

    init(
            frame: CGRect,
            playerController: CastPlayerController
    ) {
        _view.frame = frame
        _playerController = playerController
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
        //GCKCastContext.sharedInstance().presentDefaultExpandedMediaControls()
        
        //_view.addSubview(castPlayerViewController.view)
        //_view.addSubview(nativeLabel)
    }
}
