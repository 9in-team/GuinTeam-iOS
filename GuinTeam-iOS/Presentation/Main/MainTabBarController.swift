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
     
    let homeViewController = UINavigationController(rootViewController: HomeViewController(viewModel: HomeViewModel()))
    let subscribeViewController = SubscribeViewController(viewModel: SubscribeViewModel())
    let myPostViewController = MyPostViewController(viewModel: MyPostViewModel())
    let mySubmitViewController = MySubmitViewController(viewModel: MySubmitViewModel())
     
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .appColor(.main)
        tabBar.unselectedItemTintColor = .black.withAlphaComponent(0.6)
        
        homeViewController.setTabBarItem(title: "홈", image: .appSymbol(.home))
        subscribeViewController.setTabBarItem(title: "구독", image: .appSymbol(.inbox))
        myPostViewController.setTabBarItem(title: "내 모집글", image: .appSymbol(.person2))
        mySubmitViewController.setTabBarItem(title: "내 지원서", image: .appSymbol(.note))
    
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
