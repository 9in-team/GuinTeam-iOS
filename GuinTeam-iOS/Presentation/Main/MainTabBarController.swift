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

final class MainTabBarController: UITabBarController {
     
    let homeViewController = HomeViewController(viewModel: HomeViewModel())
    let subscribeViewController = SubscribeViewController(viewModel: SubscribeViewModel())
    let myPostViewController = MyPostViewController(viewModel: MyPostViewModel())
    let mySubmitViewController = MySubmitViewController(viewModel: MySubmitViewModel())
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController.setTabBarItem(title: "홈", image: UIImage(named: SymbolConstant.home.rawValue))
        subscribeViewController.setTabBarItem(title: "구독", image: UIImage(named: SymbolConstant.inbox.rawValue))
        myPostViewController.setTabBarItem(title: "내 모집글", image: UIImage(named: SymbolConstant.person2.rawValue))
        mySubmitViewController.setTabBarItem(title: "내 지원서", image: UIImage(named: SymbolConstant.note.rawValue))
    
        viewControllers = [
            homeViewController,
            subscribeViewController,
            myPostViewController,
            mySubmitViewController
        ]
    }
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

struct MainTabBarController_Previews: PreviewProvider {
    
    static let viewController = MainTabBarController()
    
    static var previews: some View {
        UIViewControllerPreview {
            viewController
        }
        .ignoresSafeArea()
        .allColorScheme(.lightModeFirst)
    }
    
}
#endif
