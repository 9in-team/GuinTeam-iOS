//
//  CALayer+Ext.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/26/23.
//

import UIKit

extension CALayer {
    
    /// Figma와 UIKit의 Shadow 렌더링 방식에 따른 차이를 보정해주기 위한 method입니다.
    func setFigmaShadow(color: UIColor = UIColor(hex: "000000"),
                        alpha: Float = 1,
                        x: CGFloat = 0,
                        y: CGFloat = 0,
                        blur: CGFloat = 4,
                        spread: CGFloat = 0,
                        radius: CGFloat = 0) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let dirX = -spread
            let rect = bounds.insetBy(dx: dirX, dy: dirX)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
}
