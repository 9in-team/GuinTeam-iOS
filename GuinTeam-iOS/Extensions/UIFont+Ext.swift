//
//  UIFont+Ext.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 1/28/24.
//

import UIKit

extension UIFont {

    static func custom(_ name: FontConstant, size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }

}
