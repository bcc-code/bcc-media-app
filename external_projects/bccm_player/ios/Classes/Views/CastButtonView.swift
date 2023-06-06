
import AVKit
import Flutter
import Foundation
import GoogleCast
import UIKit

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
        var color: UIColor?
        if let argsDict = args as? [String: Any] {
            if let colorInt = argsDict["color"] as? Int {
                color = uiColorFromHex(hexValue: colorInt)
            }
        }
        return CastButton(
            frame: frame,
            viewId: viewId,
            color: color
        )
    }
}

class CastButton: NSObject, FlutterPlatformView {
    private var _buttonView: GCKUICastButton
    private var _viewId: Int64

    init(frame: CGRect, viewId: Int64, color: UIColor?) {
        _buttonView = GCKUICastButton(frame: frame)
        if color != nil {
            _buttonView.tintColor = color
        } else {
            _buttonView.tintColor = UIColor(red: 110/255, green: 176/255, blue: 230/255, alpha: 1)
        }
        _viewId = viewId
        super.init()
    }

    func view() -> UIView {
        return _buttonView
    }
}
