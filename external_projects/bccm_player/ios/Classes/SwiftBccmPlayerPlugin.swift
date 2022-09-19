import Flutter
import UIKit
import AVKit
import GoogleCast

public class SwiftBccmPlayerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let channel = FlutterMethodChannel(name: "bccm_player", binaryMessenger: messenger)
        let instance = SwiftBccmPlayerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        let playbackListener = PlaybackListenerPigeon(binaryMessenger: messenger)
        let playbackApi = PlaybackApiImpl(playbackListener: playbackListener);

        registrar.register(
            BccmPlayerFactory(messenger: messenger, playbackApi: playbackApi),
            withId: "bccm-player")
        registrar.register(
            CastButtonFactory(messenger: messenger, playbackApi: playbackApi),
            withId: "bccm_player/cast_button")

        PlaybackPlatformPigeonSetup(registrar.messenger(), playbackApi)

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        
        
        let criteria = GCKDiscoveryCriteria(applicationID: "BC91FA3B")
        let options = GCKCastOptions(discoveryCriteria: criteria)
        GCKCastContext.setSharedInstanceWith(options)

    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}
