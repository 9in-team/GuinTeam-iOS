//
//  ViewModelProtocol.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/28/23.
//

import Foundation
import RxSwift

protocol ViewModelProtocol {
    
    var disposeBag: DisposeBag { get set }
    
    /// 비동기 Task 사용 시 사용
    var isLoading: BehaviorSubject<Bool> { get set }
    
}
