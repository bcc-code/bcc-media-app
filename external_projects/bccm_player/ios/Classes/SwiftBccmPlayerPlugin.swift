import Flutter
import UIKit

public class SwiftBccmPlayerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bccm_player", binaryMessenger: registrar.messenger())
    let instance = SwiftBccmPlayerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

    let factory = BccmPlayerFactory(messenger: registrar.messenger())
    registrar.register(factory, withId: "bccm-player")
      
    PlaybackPlatformPigeonSetup(registrar.messenger(), PlaybackApiImpl())
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
