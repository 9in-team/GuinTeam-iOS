//
//  ViewController.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/20/23.
//

import UIKit
import SnapKit
import RxSwift
import Then

final class ViewController: BaseViewController {
    
    private let label = UITextField()
        .then {
            $0.text = "9in.team"
            $0.textAlignment = .center
            $0.font = .appFont(.godoB, size: 30) // Font Test
        }
    
    private let resultLabel = UITextField()
        .then {
            $0.text = "not Tapped"
            $0.textAlignment = .center
            $0.font = .appFont(.robotoBold, size: 14) // Font Test
        }
    
    private let button = UIButton()
        .then {
            $0.setAttributedTitle(.init(string: "Touch Me!", 
                                        attributes: [.font: UIFont.appFont(.robotoMedium, size: 14)]), for: .normal)
            $0.backgroundColor = .appColor(.primary)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 8
        }
    
    private let imageView = UIImageView()
        .then {
            $0.image = UIImage.appSymbol(.inbox, color: .appColor(.primary))
            $0.contentMode = .scaleAspectFit
        }
    
    private let viewModel: ViewModel
    
    // MARK: - Init
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        bind()
    }
    
    // MARK: - Setup
    override func layout() {
        
        super.layout()
        view.addSubview(label)
        view.addSubview(resultLabel)
        view.addSubview(button)
        view.addSubview(imageView)
        
        layoutLabel()
        layoutResultLabel()
        layoutImageView()
        layoutButton()
    }
    
    private func layoutImageView() {
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.greaterThanOrEqualTo(40)
            $0.width.greaterThanOrEqualTo(40)
        }

    }
    
    private func layoutLabel() {
        label.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.center.equalToSuperview()
            $0.height.greaterThanOrEqualTo(40)
            $0.width.greaterThanOrEqualTo(100)
        }
    }
    
    private func layoutResultLabel() {
        resultLabel.snp.makeConstraints {
            $0.centerX.equalTo(label)
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.height.greaterThanOrEqualTo(40)
            $0.width.greaterThanOrEqualTo(100)
        }
    }
    

    private func layoutButton() {
        button.snp.makeConstraints {
            $0.centerX.equalTo(resultLabel)
            $0.top.equalTo(resultLabel.snp.bottom).offset(20)
            $0.height.greaterThanOrEqualTo(40)
            $0.width.greaterThanOrEqualTo(100)
        }
    }
    
    override func bind() {
        super.bind()
        let input = ViewModel.Input(tapButtonPublisher: button.rx.tap)
        let output = viewModel.transform(input: input)
        output.updateResultPublisher
            .drive(resultLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Preview
#if DEBUG && targetEnvironment(simulator)
import SwiftUI

struct MainViewController_Previews: PreviewProvider {
    
    static let viewController = ViewController(viewModel: viewModel)
    static let viewModel = ViewModel()
    
    static var previews: some View {
        UIViewControllerPreview {
            viewController
        }
        .ignoresSafeArea()
        .allColorScheme(.lightModeFirst)
        
    }
}
#endif
