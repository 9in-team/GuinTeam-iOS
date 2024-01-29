//
//  UIColor+Ext.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/26/23.
//

import UIKit

extension UIColor {

    /// Hex Code를 기준으로 컬러를 생성합니다.
    convenience init(hex hexcode: String, alpha: CGFloat = 1) {
        let scanner = Scanner(string: hexcode)
        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff

        self.init(red: Double(red) / 0xff, green: Double(green) / 0xff, blue: Double(blue) / 0xff, alpha: alpha)
    }
    
    /// 컬러를 랜덤으로 생성합니다.
    static func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    /// 앱 전반에서 사용되는 컬러 라이브러리입니다.
    static func appColor(_ color: ColorConstant) -> UIColor {
        return color.get()
    }
}
