//
//  LoginViewController.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 1/27/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import AuthenticationServices

final class LoginViewController: BaseViewController {
    
    private let viewModel: LoginViewModel
    
    // MARK: SubViews
    private let titleLabel = UILabel()
        .then {
            $0.text = "9in.team"
            $0.textColor = UIColor(hex: "FFFFFF", alpha: 1)
            $0.textAlignment = .center
            $0.font = .appFont(.godoB, size: 48)
            $0.numberOfLines = 1
        }
    
    private let subtitleLabel = UILabel()
        .then {
            $0.text = "스터디, 프로젝트 같이 할 사람?"
            $0.textColor = UIColor(hex: "FFFFFF", alpha: 1)
            $0.textAlignment = .center
            $0.font = .appFont(.robotoRegular, size: 16)
            $0.numberOfLines = 1
        }
    
    private lazy var appleSignInButton = BaseSignInButton(.apple)
    
    private lazy var kakaoSignInButton = BaseSignInButton(.kakao)
    
    // MARK: StackViews
    private lazy var titleVStack = UIStackView()
        .then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 4
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(subtitleLabel)
            
        }
    
    private lazy var buttonsVStack = UIStackView()
        .then {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .center
            $0.spacing = 12
            $0.addArrangedSubview(appleSignInButton)
            $0.addArrangedSubview(kakaoSignInButton)
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
    
    // MARK: Configure
    override func configure() {
        super.configure()
        view.backgroundColor = UIColor(hex: "1976D2")
    }
    
    // MARK: Layout
    override func layout() {
        super.layout()
        view.addSubview(titleVStack)
        view.addSubview(buttonsVStack)

        layoutTitleVStack()
        layoutSignInButtons()
    }
    
    private func layoutTitleVStack() {
        titleVStack.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(26)
        }
    }
    
    private func layoutSignInButtons() {
        [appleSignInButton, kakaoSignInButton]
            .forEach {
                $0.snp.makeConstraints {
                    $0.height.equalTo(45)
                    $0.width.equalTo(300)
                }
            }
        
        buttonsVStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    // MARK: Bind
    override func bind() {
        super.bind()
        let input = LoginViewModel.Input(appleButtonTapped: appleSignInButton.rx.tap.asObservable(),
                                         kakaoButtonTapped: kakaoSignInButton.rx.tap.asObservable())
        let output = viewModel.transform(input: input)
        
        bindAppleSignRequest(output)
    }
    
    private func bindAppleSignRequest(_ output: LoginViewModel.Output) {
        output.appleSignInRequest
            .subscribe { [weak self] request in
                self?.appleSignInButtonAction(request: request)
            }
            .disposed(by: disposeBag)
        
        output.kakaoSignInRequest
            .subscribe { _ in
                print("KakaoSign Request Returned")
            }
            .disposed(by: disposeBag)
    }
    
}

extension LoginViewController: ASAuthorizationControllerDelegate,
                               ASAuthorizationControllerPresentationContextProviding {
    
    /// Apple Authorization Request 전달.
    @objc
    func appleSignInButtonAction(request authorizationRequests: ASAuthorizationRequest) {
        let authorizationController = ASAuthorizationController(authorizationRequests: [authorizationRequests])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    /// Apple Login Modal 띄우기
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    /// Apple Login 인증 요청
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        print("인증 요청창 Presented")
    }
    
    /// 애플 로그인 오류 처리
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithError error: Error) {
        print("애플 로그인 오류발생: \(error.localizedDescription)")
        
    }
    
}

// MARK: - Preview
#if DEBUG && targetEnvironment(simulator)
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
