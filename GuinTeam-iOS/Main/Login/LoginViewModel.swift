//
//  LoginViewModel.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 1/27/24.
//

import Foundation
import RxSwift
import RxCocoa
import AuthenticationServices

final class LoginViewModel: BaseViewModel, InputOutputProtocol {

    struct Input {
        let appleSignInButtonTapped: ControlEvent<Void>
    }
    
    struct Output {
        let appleSignInRequest: Driver<ASAuthorizationAppleIDRequest?>
    }
    
    func transform(input: Input) -> Output {
        
        let appleSignInRequest = input
            .appleSignInButtonTapped
            .compactMap { [weak self] _ in
                return self?.requestAppleSignIn()
            }
            .asDriver(onErrorJustReturn: nil)

        return Output(appleSignInRequest: appleSignInRequest)
    }
    
    private func requestAppleSignIn() -> ASAuthorizationAppleIDRequest {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        return request
    }
    
}
