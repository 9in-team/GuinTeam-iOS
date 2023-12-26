//
//  BaseView.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import SnapKit
import RxSwift

class BaseView: UIView {
    
    lazy var indicatorView: ActivityIndicatorView = .init(style: .medium)
    var disposeBag = DisposeBag()
    
    private let contentView = UIView()

    // MARK: - Init
    init(backgroundColor: UIColor = .systemBackground) {
        super.init(frame: .zero)
        setBackgroungColor(backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configures
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutContentView()
    }
    
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
    
    // MARK: - Activity Indicator Methods
    /// 컨텐츠 로딩 상태에 따라 Indicator의 상태를 조절합니다.
    /// setActivityIndicator() 가 호출 되어야 화면에 표시 됩니다.
    func observeLoadingState(isPresent: BehaviorSubject<Bool>) {
        isPresent
            .observe(on: MainScheduler.instance)
            .subscribe { isPresent in
                isPresent
                ? self.indicatorView.show()
                : self.indicatorView.hide()
            }
            .disposed(by: disposeBag)
    }
    
    /// Activity Indicator를 TargetView의 중앙에 위치시킵니다.
    /// observeLoadingState(isPresent:) 로 State를 관찰합니다.
    func setActivityIndicator() {
        contentView.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.center.equalTo(contentView)
        }
    }
    
}
