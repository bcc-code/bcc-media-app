import AVKit
import Flutter
import GoogleCast
import UIKit

public class SwiftBccmPlayerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        setupCast()
        let messenger = registrar.messenger()
        let channel = FlutterMethodChannel(name: "bccm_player", binaryMessenger: messenger)
        let instance = SwiftBccmPlayerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        let playbackListener = PlaybackListenerPigeon(binaryMessenger: messenger)

        let chromecastPigeon = ChromecastPigeon(binaryMessenger: messenger)
        let playbackApi = PlaybackApiImpl(chromecastPigeon: chromecastPigeon, playbackListener: playbackListener)

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
