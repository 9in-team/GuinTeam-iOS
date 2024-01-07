//
//  UIViewController+Ext.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/28/23.
//

import UIKit

extension UIViewController {
    
    // MARK: NavigationController
    /// ViewController를 push합니다.
    func push(_ viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    /// ViewController를 Pop합니다.
    func pop(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }

    /// 지정된 ViewController가 NavigationStack의 맨 위에 올 때까지 ViewController를 Pop합니다.
    func popTo(_ viewController: UIViewController, animated: Bool = true) -> [UIViewController]? {
        return self.navigationController?.popToViewController(viewController, animated: animated)
    }
    
    /// RootViewController를 제외한 Stack의 모든 ViewController를 Pop하고 디스플레이를 업데이트합니다.
    func popToRootViewController(animated: Bool = true) {
        self.navigationController?.popToRootViewController(animated: animated)
    }

}
