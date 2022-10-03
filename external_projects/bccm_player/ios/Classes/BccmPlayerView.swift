import Flutter
import UIKit
import AVKit
import MediaPlayer

enum BccmPlayerError: Error {
    case runtimeError(String)
}

class BccmPlayerFactory: NSObject, FlutterPlatformViewFactory {
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
        let playerId = argDictionary?["player_id"] as? String
        guard playerId != nil else {
            fatalError("argument 'player_id' cannot be null")
        }
        let playerController = playbackApi.getPlayer(playerId!)
        if (playerController == nil) {
            fatalError("player with id " + playerId! + "does not exist")
        }
        if let pc = playerController as? AVQueuePlayerController {
            return AVPlayerBccmPlayerView(
                    frame: frame,
                    playerController: pc);
        }
        else if let pc = playerController as? CastPlayerController {
            return CastPlayerView(frame: frame, playerController: pc);
        } else {
            fatalError("Playercontroller is of unknown type.");
        }
    }
}

class AVPlayerBccmPlayerView: NSObject, FlutterPlatformView {
    private var _view: UIView = UIView()
    private var _playerController: AVQueuePlayerController
    private var playerViewController: AVPlayerViewController? = nil

    init(
            frame: CGRect,
            playerController: AVQueuePlayerController
    ) {
        _view.frame = frame
        _playerController = playerController
        super.init()

        // iOS views can be created here

        createNativeView(frame: frame, view: _view)
        if #available(iOS 13.0, *) {
            NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: UIScene.didEnterBackgroundNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(willBecomeActive), name: UIScene.willEnterForegroundNotification, object: nil)
        } else {
            NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: UIApplication.willResignActiveNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(willBecomeActive), name: UIApplication.willEnterForegroundNotification, object: nil)
        }
    }
    
    @objc func willResignActive(_ notification: Notification) {
        // code to execute
        print ("willResignActive")
       if let playerViewController = playerViewController {
           playerViewController.removeFromParent()
           
           let viewController = (UIApplication.shared.delegate?.window??.rootViewController)!
           print(viewController.children.map({ $0.title }))
           _playerController.releasePlayerView(playerViewController)
       }
    }
    
    @objc func willBecomeActive(_ notification: Notification) {
        // code to execute
        print ("willBecomeActive")
       if let playerViewController = playerViewController {
           _playerController.takeOwnership(playerViewController)
       }
    }
    

    func view() -> UIView {
        return _view
    }

    deinit {
        playerViewController?.removeFromParent()
        if let playerViewController = playerViewController {
            _playerController.releasePlayerView(playerViewController)
        }
        playerViewController = nil
        print("deinit playerview done")

        //_playerController?.player?.pause()
    }

    func createNativeView(frame: CGRect, view _view: UIView) {
        let audioSession = AVAudioSession.sharedInstance()
        print("bccm: audiosession category before: " + audioSession.category.rawValue)
        do {
            try audioSession.setCategory(.playback)
            try audioSession.setActive(true)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        print("bccm: audiosession category after: " + audioSession.category.rawValue)
        if (_playerController.pipController != nil) {
            playerViewController = _playerController.pipController!
        }else {
            playerViewController = AVPlayerViewController()
            
            let viewController = (UIApplication.shared.delegate?.window??.rootViewController)!
            viewController.addChild(playerViewController!)
        }
        
        if let playerViewController = playerViewController {
            //let player = AVPlayer(url: URL(string: _url)!)
            playerViewController.view.frame = frame
            playerViewController.showsPlaybackControls = true
            playerViewController.delegate = _playerController
            playerViewController.exitsFullScreenWhenPlaybackEnds = false
            playerViewController.allowsPictureInPicturePlayback = true
            if #available(iOS 14.2, *) {
                playerViewController.canStartPictureInPictureAutomaticallyFromInline = true
            }
    //
    //        let pipController = AVPictureInPictureController(playerLayer: playerViewController.view.layer as! AVPlayerLayer)
            
            _view.addSubview(playerViewController.view)
            //_view.addSubview(nativeLabel)

            _playerController.takeOwnership(playerViewController)
        }
    }
    
    var vc: UIViewController? = nil
    
    
    func asdplayerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        let viewController = (UIApplication.shared.delegate?.window??.rootViewController)!
        vc = UIViewController()
        let nativeLabel = UILabel()
        nativeLabel.text = "Showing in pip"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
        nativeLabel.center = CGPoint(x: viewController.view.frame.size.width  / 2,
                                     y: viewController.view.frame.size.height / 2)
        vc?.view.addSubview(nativeLabel)
        vc?.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        viewController.present(vc!, animated: true, completion: nil)
    }
    func asdplayerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        vc?.dismiss(animated: false)
    }
}
