//
//  BaseViewController.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import SnapKit
import RxSwift

class BaseViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    private let messageView = MessageView()

    // MARK: - Init
    init(backgroundColor: UIColor = .systemBackground) {
        super.init(nibName: nil, bundle: nil)
        setBackgroundColor(backgroundColor)
        assignTextfieldHideKeyboardGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    func setBackgroundColor(_ color: UIColor) {
        self.view.backgroundColor = color
    }

    // MARK: TextField Keyboard Gestures
    /// TextField 키보드 dismiss Gesture 등록
    private func assignTextfieldHideKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldHideKeyboard))
        view.addGestureRecognizer(tapGesture)
        view.backgroundColor = .systemBackground
    }
    
    /// TextField 키보드 dismiss
    @objc func textFieldHideKeyboard() {
        view.endEditing(true)
    }
 
}
