//
//  BaseView.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import SnapKit
import RxSwift

final class BaseView: UIView, ViewProtocol, UseDisposeBag {
    
    var viewModel: ViewModelProtocol
    var indicatorView: ActivityIndicatorView = .init(style: .medium)
    var disposeBag = DisposeBag()
    
    private let contentView = UIView()

    // MARK: - Init
    init(viewModel: ViewModelProtocol,
         backgroundColor: UIColor = .systemBackground) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setBackgroungColor(backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configures
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutContentView()
    }
    
    public func setBackgroungColor(_ color: UIColor) {
        self.contentView.backgroundColor = color
    }
    
    /// ContentView 셋업
    private func layoutContentView() {
        self.addSubview(contentView)
        self.contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
