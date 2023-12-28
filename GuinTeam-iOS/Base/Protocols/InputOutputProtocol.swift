//
//  InputOutputProtocol.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/28/23.
//

import Foundation
import RxSwift

protocol InputOutputProtocol {
    
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
    
}
