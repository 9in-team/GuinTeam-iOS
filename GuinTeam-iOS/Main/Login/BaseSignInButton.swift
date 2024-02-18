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
    
    private let type: BaseSignInButton.ButtonType
    private let height: CGFloat
        
    private let contentView = UIView()
        .then {
            $0.isUserInteractionEnabled = false
        }
    
    private lazy var logoImageContainer = UIView()
    
    private lazy var logoImageView = UIImageView()
        .then {
            $0.image = UIImage(imageLiteralResourceName: self.type.imageName)
            $0.contentMode = .scaleAspectFit
        }
    
    private lazy var signInTitleLabel = UILabel()
        .then {
            $0.text = type.title
            $0.textColor = type.textColor
            $0.textAlignment = .center
        }
    
    // MARK: Init
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
    
    // MARK: Configure
    func configure() {
        self.backgroundColor = type.backgroundColor
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
    
    // MARK: Layout
    func layout() {
        self.addSubview(contentView)
        contentView.addSubview(logoImageContainer)
        logoImageContainer.addSubview(logoImageView)
        contentView.addSubview(signInTitleLabel)

        contentView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(self).inset(13)
            $0.height.equalTo(self)
        }
        
        logoImageContainer.snp.makeConstraints {
            $0.leading.equalTo(contentView)
            $0.centerY.equalTo(contentView)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        logoImageView.snp.makeConstraints {
            $0.edges.equalTo(logoImageContainer).inset(3)
            $0.center.equalTo(logoImageContainer)
        }
        
        signInTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(logoImageView)
            $0.trailing.equalTo(contentView)
            $0.centerY.equalTo(contentView)
            
            switch type {
            case .apple:
                $0.height.equalTo(height)
                signInTitleLabel.font = .systemFont(ofSize: height / 2.33)
            case .kakao:
                $0.height.equalTo(logoImageView.snp.height)
                signInTitleLabel.font = .systemFont(ofSize: 17)
            }
        }
        
    }
    
}

extension BaseSignInButton {
    
    enum ButtonType {
        case apple
        case kakao
        
        var title: String {
            switch self {
            case .apple:
                return "Apple로 로그인"
            case .kakao:
                return "카카오 로그인"
            }
        }
        
        var textColor: UIColor {
            switch self {
            case .apple:
                return UIColor.white
            case .kakao:
                return UIColor.init(hex: "000000", alpha: 0.85)
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .apple:
                return UIColor.black
            case .kakao:
                return UIColor.init(hex: "FEE500")
            }
        }
        
        var imageName: String {
            switch self {
            case .apple:
                return "apple-logo"
            case .kakao:
                return "kakaotalk-logo"
            }
        }
        
    }
    
}

// MARK: - Preview
#if DEBUG && targetEnvironment(simulator)
import SwiftUI

struct AppleSignInButton_Previews: PreviewProvider {
    
    static let view = BaseSignInButton(.kakao)
    
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
