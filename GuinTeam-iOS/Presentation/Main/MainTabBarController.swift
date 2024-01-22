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
        
        homeViewController.setTabBarItem(title: "a", image: UIImage(systemName: "a.circle.fill"))
        subscribeViewController.setTabBarItem(title: "b", image: UIImage(systemName: "b.circle.fill"))
        myPostViewController.setTabBarItem(title: "c", image: UIImage(systemName: "c.circle.fill"))
        mySubmitViewController.setTabBarItem(title: "d", image: UIImage(systemName: "d.circle.fill"))
    
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
