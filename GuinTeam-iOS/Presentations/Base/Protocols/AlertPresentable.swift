//
//  AlertPresentable.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import RxSwift

protocol AlertPresentable: UseDisposeBag {
    func presentAlert(duration: CGFloat, isPresent sender: BehaviorSubject<Bool>)
    func dismissAlert(isPresent sender: BehaviorSubject<Bool>)
    func observeAlertState(alertView: UIView,
                           isPresent isPresentSubject: BehaviorSubject<Bool>)
}

extension AlertPresentable {
    /// 알럿을 띄웁니다.
    /// - duration 0일 경우 알럿을 자동으로 닫지  않음
    func presentAlert(duration: CGFloat = 0, isPresent sender: BehaviorSubject<Bool>) {
        sender.onNext(true)
        
        if duration != 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                sender.onNext(false)
            }
        }
    }

    /// 알럿을 수동으로 닫습니다.
    func dismissAlert(isPresent sender: BehaviorSubject<Bool>) {
        sender.onNext(false)
    }
    
    /// Alert을 초기화하고 상태를 Observe 합니다.
    func observeAlertState<T: UIView>(alertView: T,
                                      isPresent isPresentSubject: BehaviorSubject<Bool>) {
        isPresentSubject
            .observe(on: MainScheduler.instance)
            .subscribe { isPresent in
                alertView.isHidden = !isPresent
            }
            .disposed(by: disposeBag)
    }
}
