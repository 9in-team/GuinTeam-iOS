//
//  BaseViewModel.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import Foundation
import RxSwift

class BaseViewModel: ViewModelProtocol, UseDisposeBag {
    
    var disposeBag = DisposeBag()
    
    /// 비동기 Task 사용 시 사용
    var isLoading = BehaviorSubject<Bool>(value: false)
    
}
