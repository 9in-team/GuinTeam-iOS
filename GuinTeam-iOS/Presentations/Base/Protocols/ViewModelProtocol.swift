//
//  ViewModelProtocol.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import Foundation
import RxSwift

protocol ViewModelProtocol {
    
    var isLoading: BehaviorSubject<Bool> {get set}
    
}
