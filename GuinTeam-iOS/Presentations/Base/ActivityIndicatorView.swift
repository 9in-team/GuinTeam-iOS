//
//  ActivityIndicatorView.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit

final class ActivityIndicatorView: UIActivityIndicatorView {

    init(color: UIColor = .secondaryLabel, 
         style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        setColor(color: color)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Indicator의 색상을 셋업합니다.
    func setColor(color: UIColor) {
        self.tintColor = color
    }
    
    /// Indicator를 띄웁니다.
    func show() {
        self.startAnimating()
        self.isHidden = false
    }
    
    /// Indicator를 숨깁니다.
    func hide() {
        self.isHidden = true
        self.stopAnimating()
    }
    
}
