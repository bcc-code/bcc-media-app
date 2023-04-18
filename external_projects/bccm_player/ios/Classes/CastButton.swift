
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
        return CastButton(
            frame: frame, viewId: viewId
        )
    }
}

class CastButton: NSObject, FlutterPlatformView {
    private var _buttonView: GCKUICastButton
    private var _viewId: Int64

    init(frame: CGRect, viewId: Int64) {
        _buttonView = GCKUICastButton(frame: frame)
        _buttonView.tintColor = UIColor(red: 110/255, green: 176/255, blue: 230/255, alpha: 1)
        _viewId = viewId
        super.init()
    }

    func view() -> UIView {
        return _buttonView
    }
}

/*

 private var isHiddenListeners: Dictionary<Int64, (Bool) -> Void> = [:]

 isHiddenListeners[viewId] = listener

 func listener(hidden: Bool) -> Void {
     _eventChannel.("is_hidden", arguments: hidden)
 }

 */
// class CustomGCKUICastButton : GCKUICastButton {
//    var _eventSink: FlutterEventSink?
//    init(frame: CGRect, eventSink: FlutterEventSink) {
//        _eventSink = eventSink
//        super.init(frame: frame)
//    }
//
//    required init(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//
//    override public var isHidden: Bool {
//        didSet {
//            debugPrint("GCKUICastButton.isHidden didSet")
//            debugPrint(isHidden)
//            isHiddenListeners.forEach({ listenerKv in listenerKv.value(isHidden)})
//        }
//    }
//
//    override public var bounds: CGRect {
//        didSet {
//            debugPrint("GCKUICastButton.bounds didSet")
//            debugPrint(bounds)
//            isHiddenListeners.forEach({ listenerKv in listenerKv.value(bounds.isEmpty)})
//        }
//    }
// }
