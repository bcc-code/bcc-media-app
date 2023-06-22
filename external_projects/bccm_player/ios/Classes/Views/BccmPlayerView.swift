import AVKit
import Flutter
import MediaPlayer
import UIKit

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
        debugPrint("BccmPlayerFactory create")
        let argDictionary = args as! [String: Any]?
        let playerId = argDictionary?["player_id"] as? String
        let showControls = argDictionary?["show_controls"] as? Bool ?? true
        guard playerId != nil else {
            fatalError("argument 'player_id' cannot be null")
        }
        let playerController = playbackApi.getPlayer(playerId!)
        if playerController == nil {
            fatalError("player with id " + playerId! + "does not exist")
        }
        if let pc = playerController as? AVQueuePlayerController {
            return AVPlayerBccmPlayerView(
                frame: frame,
                playerController: pc,
                showControls: showControls
            )
        } else if let pc = playerController as? CastPlayerController {
            return CastPlayerView(frame: frame, playerController: pc)
        } else {
            fatalError("Playercontroller is of unknown type.")
        }
    }
}

class AVPlayerBccmPlayerView: NSObject, FlutterPlatformView {
    private var _view: UIView = .init()
    private var _playerController: AVQueuePlayerController
    private var playerViewController: AVPlayerViewController? = nil
    private var _showControls: Bool

    init(
        frame: CGRect,
        playerController: AVQueuePlayerController,
        showControls: Bool
    ) {
        debugPrint("AVPlayerBccmPlayerView init")
        _view.frame = frame
        _playerController = playerController
        _showControls = showControls
        super.init()

        createNativeView()
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
        print("willResignActive")
        reset()
    }

    @objc func willBecomeActive(_ notification: Notification) {
        // code to execute
        print("willBecomeActive")
        createNativeView()
        perform(#selector(pipFix), with: nil, afterDelay: 1)
    }

    func view() -> UIView {
        return _view
    }

    deinit {
        print("deinit playerview")
        playerViewController?.removeFromParent()
        if let playerViewController = playerViewController {
            _playerController.releasePlayerView(playerViewController)
        }
        playerViewController = nil
        print("deinit playerview done")
    }

    func createNativeView() {
        let audioSession = AVAudioSession.sharedInstance()
        print("bccm: audiosession category before: " + audioSession.category.rawValue)
        do {
            try audioSession.setCategory(.playback)
            try audioSession.setActive(true)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        print("bccm: audiosession category after: " + audioSession.category.rawValue)
        if _playerController.pipController != nil && _playerController.fullscreenViewController == nil {
            print("starting with existing pipController")
            let viewController = (UIApplication.shared.delegate?.window??.rootViewController)!
            playerViewController = _playerController.pipController!
            viewController.addChild(playerViewController!)
        } else {
            print("starting with new avplayerviewcontroller")
            playerViewController = LandscapeAVPlayerViewController()

            let viewController = (UIApplication.shared.delegate?.window??.rootViewController)!
            viewController.addChild(playerViewController!)
        }

        if let playerViewController = playerViewController {
            playerViewController.view.frame = _view.frame
            playerViewController.showsPlaybackControls = _showControls
            playerViewController.delegate = _playerController
            playerViewController.exitsFullScreenWhenPlaybackEnds = false
            playerViewController.allowsPictureInPicturePlayback = true
            playerViewController.updatesNowPlayingInfoCenter = false
            if #available(iOS 16.0, *) {
                var speeds = AVPlaybackSpeed.systemDefaultSpeeds
                speeds.append(AVPlaybackSpeed(rate: 0.75, localizedName: "0.75x"))
                speeds.sort { $0.rate < $1.rate }
                playerViewController.speeds = speeds
            }
            if #available(iOS 14.2, *) {
                playerViewController.canStartPictureInPictureAutomaticallyFromInline = true
            }
            _view.addSubview(playerViewController.view)
            _playerController.takeOwnership(playerViewController)
        }
    }

    @objc func pipFix() {
        let rate = _playerController.player.rate
        _playerController.player.pause()
        reset()
        createNativeView()
        _playerController.player.playImmediately(atRate: rate)
    }

    @objc func reset() {
        if let playerViewController = playerViewController {
            _playerController.releasePlayerView(playerViewController)
        }
        _view.subviews.forEach {
            $0.removeFromSuperview()
        }
        playerViewController?.removeFromParent()
        playerViewController = nil
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
        nativeLabel.center = CGPoint(x: viewController.view.frame.size.width / 2,
                                     y: viewController.view.frame.size.height / 2)
        vc?.view.addSubview(nativeLabel)
        vc?.modalPresentationStyle = .fullScreen
        viewController.present(vc!, animated: true, completion: nil)
    }

    func asdplayerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        vc?.dismiss(animated: false)
    }
}
