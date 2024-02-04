//
//  BaseViewController.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/21/23.
//

import UIKit
import SnapKit
import RxSwift

class BaseViewController: UIViewController, ViewControllerProtocol {

    lazy var navigationBar = NavigationBar(parentViewControlle: self)
    
    lazy var disposeBag = DisposeBag()
    
    private let messageView = MessageView()

    lazy var activityIndicator: ActivityIndicatorView = .init(style: .medium)
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignTextfieldHideKeyboardGesture()
        
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    func configure() {
        setBackgroundColor(.systemBackground)
    }
    
    func setBackgroundColor(_ color: UIColor) {
        self.view.backgroundColor = color
    }

    // MARK: TextField Keyboard Gestures
    /// TextField 키보드 dismiss Gesture 등록
    private func assignTextfieldHideKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldHideKeyboard))
        view.addGestureRecognizer(tapGesture)
        view.backgroundColor = .systemBackground
    }
    
    /// TextField 키보드 dismiss
    @objc func textFieldHideKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Layout
    func layout() {
        
    }
    
    // MARK: - Bind
    func bind() {
        
    }
    
    // MARK: - Observe
    func observe() {
        
    }
    
    // MARK: - Navigation Bar
    func setNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(87 + ScreenUtil.safeAreaSize.top)
        }
    }
    
    // MARK: - Activity Indicator
    /// Activity Indicator를 TargetView의 중앙에 위치시킵니다.
    /// observeLoadingState(isPresent:) 로 State를 관찰합니다.
    func setActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
    
    /// 컨텐츠 로딩 상태에 따라 Indicator의 상태를 조절합니다.
    /// setActivityIndicator() 가 호출 되어야 화면에 표시 됩니다.
    func observeLoadingState(isLoading: BehaviorSubject<Bool>) {
        isLoading
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] isPresent in
                isPresent
                ? self?.activityIndicator.show()
                : self?.activityIndicator.hide()
            }
            .disposed(by: disposeBag)
    }
 
}
