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
        .then { label in
            label.text = "Hello World!"
            label.textAlignment = .center
        }
    
    private let resultLabel = UITextField()
        .then { label in
            label.text = ""
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 18, weight: .bold)
        }
    
    private let button = UIButton()
        .then { button in
            button.setTitle("Touch Me!", for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
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
        layoutLabel()
        layoutResultLabel()
        layoutButton()
    }
    
    private func layoutLabel() {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.greaterThanOrEqualTo(40)
            make.width.greaterThanOrEqualTo(100)
        }
    }
    
    private func layoutResultLabel() {
        view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalTo(label)
            make.top.equalTo(label.snp.bottom).offset(20)
            make.height.greaterThanOrEqualTo(40)
            make.width.greaterThanOrEqualTo(100)
        }
    }
    
    private func layoutButton() {
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalTo(resultLabel)
            make.top.equalTo(resultLabel.snp.bottom).offset(20)
            make.height.greaterThanOrEqualTo(40)
            make.width.greaterThanOrEqualTo(100)
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
#if DEBUG
import SwiftUI

struct MainViewController_Previews: PreviewProvider {
    
    static let viewController = ViewController(viewModel: viewModel)
    static let viewModel = ViewModel()
    
    static var previews: some View {
        UIViewControllerPreview {
            viewController
        }
        .ignoresSafeArea()
    }
}
#endif
