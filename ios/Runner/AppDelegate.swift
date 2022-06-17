import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    weak var registrar = self.registrar(forPlugin: "plugin-name")
    let factory = BccmPlayerFactory(messenger: registrar!.messenger())
    self.registrar(forPlugin: "bccm-player")!.register(
      factory,
      withId: "bccm-player")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
