//
//  UIView+Ext.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/26/23.
//

import UIKit

extension UIView {
    
    public func shadow(color: UIColor = .black,
                       alpha: Float = 0.25,
                       x: CGFloat = 0,
                       y: CGFloat = 0,
                       blur: CGFloat = 1,
                       spread: CGFloat = 0,
                       radius: CGFloat = 0) {
        self.layer.setFigmaShadow(color: color, alpha: alpha, x: x, y: y, blur: blur, spread: spread, radius: radius)
    }
    
}
