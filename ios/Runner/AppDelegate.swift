import AVKit
import FirebaseCore
import FirebaseMessaging
import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
    override func application(_ application: UIApplication,
                              didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        FirebaseApp.configure()

        // Start APNs registration during native launch. With Flutter's implicit-engine
        // lifecycle, Firebase Messaging plugin registration happens later, which can
        // otherwise leave the APNs token unavailable when Dart first accesses FCM.
        application.registerForRemoteNotifications()

        let flutterResult = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return flutterResult
    }

    func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
        GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
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

// Under the UIScene lifecycle the app delegate no longer receives
// applicationDidBecomeActive, so the badge reset lives here instead.
class SceneDelegate: FlutterSceneDelegate {
    override func sceneDidBecomeActive(_ scene: UIScene) {
        super.sceneDidBecomeActive(scene)
        if #available(iOS 16.0, *) {
            UNUserNotificationCenter.current().setBadgeCount(0)
        } else {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}
