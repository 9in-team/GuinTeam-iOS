//
//  BaseSignInButton.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 1/29/24.
//
//  버튼 디자인 가이드
//  https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple

import UIKit
import SnapKit
import Then
import RxCocoa

final class BaseSignInButton: UIButton {
    
    enum ButtonType {
        case apple
        
        var title: String {
            return "Apple로 로그인"
        }
        
        var textColor: UIColor {
            return UIColor.white
        }
        
        var imageName: String {
            return "apple-sign-logo"
        }
    }
    
    private let type: BaseSignInButton.ButtonType
    private let height: CGFloat
    
    private lazy var logoImage = UIImageView()
        .then {
            $0.image = UIImage(imageLiteralResourceName: self.type.imageName)
            $0.contentMode = .scaleAspectFit
        }
    
    private lazy var signInTitle = UILabel()
        .then {
            $0.text = type.title
            $0.textColor = type.textColor
            $0.font = .systemFont(ofSize: height / 2.33)
            $0.textAlignment = .center
        }
    
    init(_ type: BaseSignInButton.ButtonType, height: CGFloat = 44) {
        self.type = type
        self.height = height
        super.init(frame: .zero)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        
    }
    
    func layout() {
        self.addSubview(logoImage)
        self.addSubview(signInTitle)

        logoImage.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.centerY.equalTo(self)
            make.height.equalTo(height)
            make.width.equalTo(height)
        }
        
        signInTitle.snp.makeConstraints {
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self)
            $0.centerY.equalTo(self)
            $0.height.equalTo(height)
        }
        
    }
    
}

// MARK: - Preview
#if DEBUG && targetEnvironment(simulator)
import SwiftUI

struct AppleSignInButton_Previews: PreviewProvider {
    
    static let view = BaseSignInButton(.apple)
    
    static var previews: some View {
        UIViewPreview {
            view
        }
        .frame(height: 44)
        .frame(width: .infinity)
        .onAppear {
            
        }
    }
}
#endif
