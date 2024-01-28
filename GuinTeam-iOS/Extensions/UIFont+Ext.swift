//
//  UIFont+Ext.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 1/28/24.
//

import UIKit

extension UIFont {

    /// FontConstant에 나열된 Font를 리턴합니다.
    static func custom(_ name: FontConstant, size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }

}
