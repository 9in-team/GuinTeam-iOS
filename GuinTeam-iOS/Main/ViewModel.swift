//
//  ViewModel.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/28/23.
//

import Foundation
import RxSwift
import RxCocoa

final class ViewModel: BaseViewModel, InputOutputProtocol {
    
    struct Input {
        let tapButtonPublisher: ControlEvent<Void>
    }
    
    struct Output {
        let updateResultPublisher: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let updateResult = input.tapButtonPublisher
            .map { _ in
                return "Tapped!!"
            }
            .asDriver(onErrorJustReturn: "ERROR")
        
        return Output(updateResultPublisher: updateResult)
    }
    
}
