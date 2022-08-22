import Flutter
import UIKit

public class SwiftBccmPlayerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      let messenger = registrar.messenger()
    let channel = FlutterMethodChannel(name: "bccm_player", binaryMessenger: messenger)
    let instance = SwiftBccmPlayerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
      
      let playbackApi = PlaybackApiImpl();

      let factory = BccmPlayerFactory(messenger: messenger, playbackApi: playbackApi)
    registrar.register(factory, withId: "bccm-player")
      
    PlaybackPlatformPigeonSetup(registrar.messenger(), playbackApi)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
