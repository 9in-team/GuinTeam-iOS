//
//  BaseView.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import SnapKit
import RxSwift

class BaseView: UIView, ViewProtocol {
    
    lazy var disposeBag = DisposeBag()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        
        configure()
        layout()
        observe()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configures
    func setBackgroungColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    func configure() {
        
    }
    
    func layout() {
        
    }
    
    func observe() {

    }
    
}
