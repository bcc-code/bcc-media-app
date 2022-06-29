import Flutter
import UIKit
import AVKit

class BccmPlayerFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return BccmPlayerView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

class BccmPlayerView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private var _playerController: AVPlayerViewController?

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        _view.frame = frame
        super.init()
        // iOS views can be created here
        createNativeView(frame: frame, view: _view)
    }

    func view() -> UIView {
        return _view
    }
    
    deinit {
        
        _playerController?.player?.pause()
    }

    func createNativeView(frame: CGRect, view _view: UIView){
        let nativeLabel = UILabel()
        nativeLabel.text = "Native text from iOS"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
        
        let playerView = UIView()
        
        let player = AVPlayer(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8")!)
        
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.view.frame = frame
        playerController.showsPlaybackControls = true
        
        
        _view.addSubview(playerController.view)
        //_view.addSubview(nativeLabel)
        
        let viewController = (UIApplication.shared.delegate?.window??.rootViewController)!
        viewController.addChild(playerController)
        
        player.play()
    }
}
