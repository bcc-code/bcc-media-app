import AVKit
import FirebaseCore
import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    override func application(_ application: UIApplication,
                              didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        FirebaseApp.configure()
        GeneratedPluginRegistrant.register(with: self)
        let flutterResult = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return flutterResult
    }

    override func application(_ application: UIApplication,
                              supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
    {
        if fetchCurrentVC(self.window?.rootViewController).debugDescription.contains("AVFullScreenViewController") {
            return .landscape
        }
        return .portrait
    }

    func fetchCurrentVC(_ viewController: UIViewController?) -> UIViewController? {
        if let tabBarController = viewController as? UITabBarController {
            return fetchCurrentVC(tabBarController.selectedViewController)
        }

        if let navigationController = viewController as? UINavigationController {
            return fetchCurrentVC(navigationController.visibleViewController)
        }

        if let viewController = viewController?.presentedViewController {
            return fetchCurrentVC(viewController)
        }

        return viewController
    }
}
