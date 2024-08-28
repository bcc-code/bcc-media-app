import AVKit
import FirebaseCore
import FirebaseMessaging
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
        
        do {
            try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try? AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Could not set audioSession")
        }
        
        let flutterResult = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return flutterResult
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

    // For background notifications, call the API inside the UIApplicationDelegate or NSApplicationDelegate method:
    override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        Messaging.serviceExtension().exportDeliveryMetricsToBigQuery(withMessageInfo: userInfo)
    }
}
