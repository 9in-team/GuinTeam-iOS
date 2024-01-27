//
//  LoginViewController.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 1/27/24.
//

import UIKit
import RxSwift
import SnapKit
import Then

final class LoginViewController: BaseViewController {
    
    private let viewModel: LoginViewModel
    
    // MARK: Views
    private let titleLabel = UILabel().then {
        $0.text = "9in.team"
        $0.textColor = UIColor(hex: "FFFFFF", alpha: 1)
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 48)
        $0.numberOfLines = 1
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = "스터디, 프로젝트 같이 할 사람?"
        $0.textColor = UIColor(hex: "FFFFFF", alpha: 1)
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 1
    }
    
    private lazy var titleVStack = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 4
    }
    
    // MARK: Init
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
        bind()
    }

    override func configure() {
        super.configure()
        view.backgroundColor = UIColor(hex: "1976D2")
    }
    
    override func layout() {
        super.layout()
        view.addSubview(titleVStack)
        titleVStack.addArrangedSubview(titleLabel)
        titleVStack.addArrangedSubview(subtitleLabel)
        layoutTitleVStack()
    }
    
    private func layoutTitleVStack() {
        titleVStack.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(26)
        }
    }
    
    override func bind() {
        super.bind()
    }
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

struct LoginViewController_Previews: PreviewProvider {
    
    static let viewController = LoginViewController(viewModel: viewModel)
    static let viewModel = LoginViewModel()
    
    static var previews: some View {
        UIViewControllerPreview {
            viewController
        }
        .ignoresSafeArea()
    }
}
#endif
