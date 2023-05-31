import AVKit

class LandscapeAVPlayerViewController: AVPlayerViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 16.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
        }
        addObserver(self, forKeyPath: #keyPath(view.bounds), options: [.old, .new], context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(view.bounds) {
            // detect only changes
            if let oldValue = change?[.oldKey] as? CGRect, oldValue != CGRect.zero, let newValue = change?[.newKey] as? CGRect {
                // no need to track the initial bounds change, and only changes
                if !oldValue.equalTo(CGRect.zero), !oldValue.equalTo(newValue) {
                    if newValue.size.height < UIScreen.main.bounds.height {
                        print("normal screen")
                    } else {
                        print("fullscreen")
                    }
                }
            }
        }
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
    }

    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        if #available(iOS 16.0, *) {
//            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
//            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
//
//            let nav = (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.topViewController
//            nav?.setNeedsUpdateOfSupportedInterfaceOrientations()
//        }
    }

    override func willChangeValue(forKey key: String) {
        super.willChangeValue(forKey: key)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
//        if #available(iOS 16.0, *) {
//            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
//            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
//
//            let nav = (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.topViewController
//            nav?.setNeedsUpdateOfSupportedInterfaceOrientations()
//        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
}
