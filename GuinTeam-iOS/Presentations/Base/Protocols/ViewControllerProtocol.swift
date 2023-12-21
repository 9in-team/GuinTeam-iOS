//
//  ViewControllerProtocol.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import Foundation
import RxSwift

protocol ViewControllerProtocol {
    
    func configure()
    func layout()
    func bind()
    
}

extension ViewControllerProtocol {
    
    func bind() { }
    
}
