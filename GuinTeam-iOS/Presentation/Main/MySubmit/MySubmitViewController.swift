//
//  MySubmitViewController.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 1/22/24.
//

import UIKit
import SnapKit
import RxSwift
import Then

final class MySubmitViewController: BaseViewController {
    
    private let label = UITextField()
        .then {
            $0.text = "MySubmit!"
            $0.textAlignment = .center
        }
    
    private let viewModel: MySubmitViewModel
    
    // MARK: - Init
    init(viewModel: MySubmitViewModel) {
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

        layoutLabel()
    }
    
    private func layoutLabel() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.greaterThanOrEqualTo(40)
            $0.width.greaterThanOrEqualTo(100)
        }
    }
    override func bind() {
        super.bind()
        let input = MySubmitViewModel.Input()
        let output = viewModel.transform(input: input)
    }
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

struct MySubmitViewController_Previews: PreviewProvider {
    
    static let viewController = MySubmitViewController(viewModel: viewModel)
    static let viewModel = MySubmitViewModel()
    
    static var previews: some View {
        UIViewControllerPreview {
            viewController
        }
        .ignoresSafeArea()
        .allColorScheme(.lightModeFirst)
    }
    
}
#endif
