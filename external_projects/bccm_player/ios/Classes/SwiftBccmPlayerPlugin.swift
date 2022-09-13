import Flutter
import UIKit
import AVKit

public class SwiftBccmPlayerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let channel = FlutterMethodChannel(name: "bccm_player", binaryMessenger: messenger)
        let instance = SwiftBccmPlayerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        let playbackListener = PlaybackListenerPigeon(binaryMessenger: messenger)
        let playbackApi = PlaybackApiImpl(playbackListener: playbackListener);

        let factory = BccmPlayerFactory(messenger: messenger, playbackApi: playbackApi)
        registrar.register(factory, withId: "bccm-player")

        PlaybackPlatformPigeonSetup(registrar.messenger(), playbackApi)

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }

    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}
