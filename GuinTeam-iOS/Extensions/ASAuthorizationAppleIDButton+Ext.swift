//
//  ASAuthorizationAppleIDButton+Ext.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 1/27/24.
//

import AuthenticationServices
import RxSwift
import RxCocoa

extension Reactive where Base: ASAuthorizationAppleIDButton {
    
    var tap: ControlEvent<Void> {
        let source = self.controlEvent(.touchUpInside)
        return ControlEvent(events: source)
    }
    
}
