//
//  ExampleProtocol.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/28/23.
//

import Foundation

protocol ExampleProtocol {
    
    associatedtype Example
    
    static var example: Example { get set }
    
}
