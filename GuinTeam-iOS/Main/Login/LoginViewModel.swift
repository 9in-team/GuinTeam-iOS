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
        let appleButtonTapped: Observable<Void>
        let kakaoButtonTapped: Observable<Void>
    }
    
    struct Output {
        let appleSignInRequest: Observable<ASAuthorizationAppleIDRequest>
        let kakaoSignInRequest: Observable<Void>

    }
    
    func transform(input: Input) -> Output {
        
        let appleSignInRequest = input.appleButtonTapped
            .compactMap { [weak self] _ in
                return self?.requestAppleSignIn()
            }
            .asObservable()
        
        let kakaoSignInRequest = input.kakaoButtonTapped
            .compactMap {
                print("Kakao Button Tapped")
                // TODO: HJ - Kakao SDK추가 후 요청 구현.
                return $0
            }
            .asObservable()

        return Output(appleSignInRequest: appleSignInRequest, kakaoSignInRequest: kakaoSignInRequest)
    }
    
    private func requestAppleSignIn() -> ASAuthorizationAppleIDRequest {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        return request
    }
    
}
