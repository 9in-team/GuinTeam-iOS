//
//  BaseView.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import SnapKit
import RxSwift

class BaseView<VM: BaseViewModel>: UIView {
    
    let viewModel: VM
    lazy var activityIndicator: ActivityIndicatorView = .init(style: .medium)
    var disposeBag = DisposeBag()
    
    private let contentView = UIView()

    // MARK: - Init
    init(viewModel: VM, 
         backgroundColor: UIColor = .systemBackground,
         withActivityIndicator: Bool = false) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setBackgroungColor(backgroundColor)
        layoutContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configures
    func setBackgroungColor(_ color: UIColor) {
        self.contentView.backgroundColor = color
    }
    
    // MARK: - Setup ContentView
    /// Base가 되는 ContentView계층을 추가합니다.
    private func layoutContentView() {
        self.addSubview(contentView)
        self.contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    private func setContentViewInset() {
        self.addSubview(contentView)
        self.contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    // MARK: - Activity Indicator Methods
    /// Activity Indicator를 TargetView의 중앙에 위치시킵니다.
    /// observeLoadingState(isPresent:) 로 State를 관찰합니다.
    func setActivityIndicator() {
        contentView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(contentView)
        }
        observeLoadingState()
    }
    
    /// 컨텐츠 로딩 상태에 따라 Indicator의 상태를 조절합니다.
    /// setActivityIndicator() 가 호출 되어야 화면에 표시 됩니다.
    private func observeLoadingState() {
        viewModel.isLoading
            .observe(on: MainScheduler.instance)
            .subscribe { isPresent in
                isPresent
                ? self.activityIndicator.show()
                : self.activityIndicator.hide()
            }
            .disposed(by: disposeBag)
    }
    
}
