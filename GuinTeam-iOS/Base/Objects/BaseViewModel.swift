//
//  BaseViewModel.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import Foundation
import RxSwift

class BaseViewModel: ViewModelProtocol {
    
    lazy var disposeBag = DisposeBag()
    
    lazy var isLoading = BehaviorSubject<Bool>(value: false)
    
}
