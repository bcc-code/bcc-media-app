import Foundation

func uiColorFromHex(hexValue: Int) -> UIColor {
    let red = CGFloat((hexValue & 0x00FF0000) >> 16)
    let green = CGFloat((hexValue & 0x0000FF00) >> 8)
    let blue = CGFloat(hexValue & 0x000000FF)
    let alpha = CGFloat((hexValue & 0xFF000000) >> 24)
    debugPrint("red: \(red), green: \(green), blue: \(blue), alpha: \(alpha)")
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha / 255)
}
