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
        
        let flutterResult = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        print(self)
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let playerChannel = FlutterMethodChannel(name: "app.bcc.media/modal-player",
                                                  binaryMessenger: controller.binaryMessenger)
        playerChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // This method is invoked on the UI thread.
            guard call.method == "open" else {
              result(FlutterMethodNotImplemented)
              return
            }
            let arg = call.arguments as! Dictionary<String, Any>
            let url = arg["url"] as! String
            let c = PlayerViewController(url: url)
            let navigation = UINavigationController .init(rootViewController: c)
            let viewController : UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
            viewController?.present(navigation, animated:true, completion: nil)
        })
        
        
        return flutterResult
    }

}
