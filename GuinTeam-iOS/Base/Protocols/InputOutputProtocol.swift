//
//  InputOutputProtocol.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/28/23.
//

import Foundation

protocol InputOutputProtocol {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
    
}
