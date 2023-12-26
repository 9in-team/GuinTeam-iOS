//
//  BaseViewModel.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import Foundation
import RxSwift

class BaseViewModel {
    
    var disposeBag = DisposeBag()
    
    /// 비동기 Task 사용 시 사용
    var isLoading = BehaviorSubject<Bool>(value: false)
    
    /// 하단 메시지 이벤트
    var isPresentMessage = BehaviorSubject<Bool>(value: false)
    var presentMessage = BehaviorSubject<String>(value: "")
    
    func sendMessage(message: String) {
        self.presentMessage.onNext(message)
        self.isPresentMessage.onNext(true)
    }
    
}
