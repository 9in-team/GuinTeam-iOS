//
//  NavigationBar.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 1/29/24.
//

import UIKit

class NavigationBar: BaseView {
    
    let parentViewControlle: UIViewController
           
    private let titleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 5
    }
    
    private let titleLabel: UILabel = UILabel().then {
        $0.textColor = .white
    }

    private lazy var rightButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 11
    }
    
    private let bottomViewBar = UIView().then {
        $0.backgroundColor = .white
    }
    
    private var isRoot: Bool {
        guard let navigationController = parentViewControlle.navigationController else {
            return false
        }
        return navigationController.viewControllers.count <= 1
    }
    
    // MARK: - Init
    init(parentViewControlle: UIViewController) {
        self.parentViewControlle = parentViewControlle
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - customer setting
    func setNavigation(title: String, rightButtons: [NavigationItemType] = []) {
        if !isRoot {
            let button = makeButton(with: .appSymbol(.back), size: 24, action: UIAction { [weak self] _ in
                self?.parentViewControlle.pop()
            })
            titleStackView.addArrangedSubview(button)
        }
        titleStackView.addArrangedSubview(titleLabel)
        titleLabel.text = title
        titleLabel.font = .appFont(.godoB, size: isRoot ? 36 : 24)
        
        appendRightButton(rightButtons)
    }

    // MARK: - private setting method
    private func appendRightButton(_ rigthButtons: [NavigationItemType]) {
        for rigthButton in rigthButtons {
            switch (rigthButton) {
            case .setting:
                let button = makeButton(with: .appSymbol(.profileEdit), size: 32, action: UIAction { _ in
                    // parentViewControlle.push(SettingViewController)
                })
                
                rightButtonStackView.addArrangedSubview(button)
            case .chatting:
                let button = makeButton(with: .appSymbol(.chat), size: 32, action: UIAction { _ in
                    // parentViewControlle.push(ChattingViewController)
                })

                rightButtonStackView.addArrangedSubview(button)
            }
        }
    }

    private func makeButton(with image: UIImage?, size: CGFloat, action: UIAction) -> UIButton {
        let button = UIButton()
        button.snp.makeConstraints {
            $0.width.height.equalTo(size)
        }
        button.setImage(image, for: .normal)
        button.addAction(action, for: .touchUpInside)
        return button
    }
    
    // MARK: - configure
    override func configure() {
        super.configure()
        
        clipsToBounds = true
        setBackgroungColor(.appColor(.main))
    }
    
    override func layout() {
        super.layout()
        
        addSubview(titleStackView)
        addSubview(rightButtonStackView)
        addSubview(bottomViewBar)
        
        layoutTitleStackView()
        layoutRightButtonStackView()
        layoutBottomViewBar()
    }
    
    private func layoutTitleStackView() {
        titleStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(isRoot ? 20 : 9)
            $0.bottom.equalToSuperview().inset(41)
        }
    }
    
    private func layoutRightButtonStackView() {
        rightButtonStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(27)
            $0.centerY.equalTo(titleStackView)
        }
    }
    
    private func layoutBottomViewBar() {
        bottomViewBar.snp.makeConstraints {
            $0.height.equalTo(25)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(12.5)
        }
        bottomViewBar.layer.cornerRadius = 12.5
    }
    
}

enum NavigationItemType {
    case setting
    case chatting
}
