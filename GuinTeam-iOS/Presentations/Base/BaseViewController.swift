//
//  BaseViewController.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import SnapKit
import RxSwift

class BaseViewController: UIViewController, UseDisposeBag {
    
    var disposeBag = DisposeBag()
    
    init(backgroundColor: UIColor = .systemBackground) {
        super.init(nibName: nil, bundle: nil)
        setBackgroundColor(backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackgroundColor(_ color: UIColor) {
        self.view.backgroundColor = color
    }

}
