//
//  BaseViewProtocol.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import RxSwift

protocol ViewProtocol: UseDisposeBag {
    
    func setData<T>(data: T)
    func layoutActivityIndicator(targetView: UIView)
    var indicatorView: ActivityIndicatorView {get set}
    
}

extension ViewProtocol {

    func setData<T>(data: T) {}
    
    /// 로딩 상태에 따라 Indicator의 상태를 조절합니다.
    func observeLoadingState(isPresent: BehaviorSubject<Bool>, targetView: UIView) {
        layoutActivityIndicator(targetView: targetView)
        
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
    func layoutActivityIndicator(targetView: UIView) {
        targetView.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.center.equalTo(targetView)
        }
    }
}
