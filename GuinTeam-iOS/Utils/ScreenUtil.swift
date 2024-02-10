//
//  ScreenUtil.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 2/4/24.
//

import UIKit

class ScreenUtil {
    
    static var window: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return nil
        }
        
        return window
    }
            
    static var safeAreaSize: UIEdgeInsets {
        guard let window = window else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

        return window.safeAreaInsets
    }

    static var displaySize: CGSize {
        guard let window = window else {
            return CGSize(width: 0, height: 0)
        }

        return window.frame.size
    }

    static var rootViewController: UIViewController? {
        guard let window = window else {
            return nil
        }

        return window.rootViewController
    }

}
