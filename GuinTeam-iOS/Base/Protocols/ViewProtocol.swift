//
//  ViewProtocol.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/28/23.
//

import Foundation
import RxSwift

protocol ViewProtocol: UISetupProtocol {
        
    var disposeBag: DisposeBag { get set }
    
    func observe()
    
}
