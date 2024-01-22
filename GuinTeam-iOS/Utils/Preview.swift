//
//  Preview.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/19/23.
//

#if DEBUG && targetEnvironment(simulator)
import SwiftUI

struct UIViewControllerPreview<MainTabBarController: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: MainTabBarController
    
    init(_ builder: @escaping () -> MainTabBarController) {
        viewController = builder()
    }
    
    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> MainTabBarController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {
        
    }
}

struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    // MARK: UIViewRepresentable
    func makeUIView(context: Context) -> UIView {
        return view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

extension View {
    /// 시뮬레이터에서 라이트모드/다크모드가 모두 표시되도록 합니다.
    /// isReverse를 true로
    func allColorScheme(_ first: FirstScheme = .lightModeFirst) -> some View {
        ForEach(first == .darkModeFirst ? ColorScheme.allCases.reversed() : ColorScheme.allCases, id: \.self) {
            self.preferredColorScheme($0)
        }
    }
    
}

enum FirstScheme {
    case darkModeFirst
    case lightModeFirst
}
#endif
