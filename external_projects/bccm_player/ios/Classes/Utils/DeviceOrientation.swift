//
//  DeviceOrientation.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 23/01/2023.
//

import UIKit

final class DeviceOrientation {
    
    static let shared: DeviceOrientation = DeviceOrientation()
    
    // MARK: - Private methods
    
    @available(iOS 16.0, *)
    private var windowScene: UIWindowScene? {
        return UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    // MARK: - Public methods
    
    func set(orientation: UIInterfaceOrientationMask) {
        if #available(iOS 16.0, *) {
            debugPrint("requestGeometryUpdate: " + orientation.rawValue.description)
            debugPrint("windowScene: " + windowScene.debugDescription)
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: orientation), errorHandler: { err in debugPrint(err.localizedDescription)})
        } else {
            UIDevice.current.setValue(orientation.toUIInterfaceOrientation.rawValue, forKey: "orientation")
        }
    }
    
    var isLandscape: Bool {
        if #available(iOS 16.0, *) {
            return windowScene?.interfaceOrientation.isLandscape ?? false
        }
        return UIDevice.current.orientation.isLandscape
    }
    
    var isPortrait: Bool {
        if #available(iOS 16.0, *) {
            return windowScene?.interfaceOrientation.isPortrait ?? false
        }
        return UIDevice.current.orientation.isPortrait
    }
    
    var isFlat: Bool {
        if #available(iOS 16.0, *) {
            return false
        }
        return UIDevice.current.orientation.isFlat
    }
}

extension UIInterfaceOrientationMask {
    var toUIInterfaceOrientation: UIInterfaceOrientation {
        switch self {
        case .portrait:
            return UIInterfaceOrientation.portrait
        case .portraitUpsideDown:
            return UIInterfaceOrientation.portraitUpsideDown
        case .landscapeRight:
            return UIInterfaceOrientation.landscapeRight
        case .landscapeLeft:
            return UIInterfaceOrientation.landscapeLeft
        default:
            return UIInterfaceOrientation.unknown
        }
    }
}
