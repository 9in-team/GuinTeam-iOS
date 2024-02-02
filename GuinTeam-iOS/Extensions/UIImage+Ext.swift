//
//  UIImage+Ext.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 1/28/24.
//

import UIKit

extension UIImage {
    
    /// Optional 이미지 nil 병합용 Placeholder
    static func emptyPlaceHolder() -> UIImage {
        return UIImage(systemName: "exclamationmark.triangle.fill")!
    }
    
    /// SymbolConstant에 정의된 이미지를 가져옵니다.
    /// - Parameters:
    ///     - name: SymbolConstant에 나열된 Symbol을 가져옵니다.
    ///     - color: Symbol Tint Color를 결정합니다.
    static func appSymbol(_ name: SymbolConstant, color: UIColor = .white) -> UIImage {
        let symbol = UIImage(named: name.rawValue)?.withTintColor(color, renderingMode: .alwaysOriginal)
        return symbol ?? emptyPlaceHolder()
    }
    
}
