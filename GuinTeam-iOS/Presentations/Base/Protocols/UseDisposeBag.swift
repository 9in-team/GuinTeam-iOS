//
//  UseDisposeBag.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import Foundation
import RxSwift

protocol UseDisposeBag {
    
    var disposeBag: DisposeBag {get set}
    
    mutating func dispose()
    
}

extension UseDisposeBag {
    
    mutating func dispose() {
        self.disposeBag = .init()
    }
    
}
