//
//  SceneDelegate.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/19/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, 
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        
        let viewModel = LoginViewModel()
        let rootVC = LoginViewController(viewModel: viewModel)
        
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
    }

}
