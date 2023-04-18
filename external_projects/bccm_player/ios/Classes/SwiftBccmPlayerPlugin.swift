import AVKit
import Flutter
import GoogleCast
import UIKit

public class SwiftBccmPlayerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let criteria = GCKDiscoveryCriteria(applicationID: "BC91FA3B")
        let options = GCKCastOptions(discoveryCriteria: criteria)
        GCKCastContext.setSharedInstanceWith(options)
        let styler = GCKUIStyle.sharedInstance()
        styler.castViews.mediaControl.expandedController.backgroundImageContentMode = UIImageView.ContentMode.scaleAspectFit.rawValue as NSNumber
        styler.castViews.mediaControl.expandedController.backgroundColor = UIColor(red: CGFloat(13/255.0), green: CGFloat(22/255.0), blue: CGFloat(55/255.0), alpha: CGFloat(1.0))

        GCKCastContext.sharedInstance().useDefaultExpandedMediaControls = false

        let messenger = registrar.messenger()
        let channel = FlutterMethodChannel(name: "bccm_player", binaryMessenger: messenger)
        let instance = SwiftBccmPlayerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        let playbackListener = PlaybackListenerPigeon(binaryMessenger: messenger)

        let chromecastPigeon = ChromecastPigeon(binaryMessenger: messenger)

        let castPlayerController = CastPlayerController(chromecastPigeon: chromecastPigeon, playbackListener: playbackListener)
        GCKCastContext.sharedInstance().sessionManager.add(castPlayerController)

        let playbackApi = PlaybackApiImpl(chromecastPigeon: chromecastPigeon, castPlayerController: castPlayerController, playbackListener: playbackListener)
        castPlayerController.setPlaybackApi(playbackApi)

        registrar.register(
            BccmPlayerFactory(messenger: messenger, playbackApi: playbackApi),
            withId: "bccm-player")
        registrar.register(
            CastPlayerViewFactory(messenger: messenger, playbackApi: playbackApi),
            withId: "bccm-cast-player")
        registrar.register(
            CastButtonFactory(messenger: messenger, playbackApi: playbackApi),
            withId: "bccm_player/cast_button")

        PlaybackPlatformPigeonSetup(registrar.messenger(), playbackApi)

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback)
            UIApplication.shared.beginReceivingRemoteControlEvents()
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}
