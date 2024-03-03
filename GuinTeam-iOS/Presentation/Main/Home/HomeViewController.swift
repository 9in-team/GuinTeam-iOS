//
//  HomeViewController.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 1/22/24.
//

import UIKit
import SnapKit
import RxSwift
import Then
import RxCocoa

final class HomeViewController: BaseViewController {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        .then {
            $0.delegate = self
            $0.register(from: TeamCollectionViewCell.self)
        }
    
    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = 16
        return collectionViewFlowLayout
    }()
    
    private let viewModel: HomeViewModel
    
    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    override func layout() {
        super.layout()
        
        setNavigationBar()
        navigationBar.setNavigation(title: "9in.team", rightButtons: [.setting, .chatting])
        
        view.addSubview(collectionView)
        
        layoutCollectionView()
    }
    
    private func layoutCollectionView() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    override func bind() {
        super.bind()
        
        let input = HomeViewModel.Input(getTeamListAction: Observable.just(()))
        let output = viewModel.transform(input: input)
        
        output.updateResultPublisher
            .bind(to: collectionView.rxItems(cellType: TeamCollectionViewCell.self)) { _, model, cell in
            cell.setData(model)
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 40, height: 116)
    }
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

struct HomeViewController_Previews: PreviewProvider {
    
    static let viewController = HomeViewController(viewModel: viewModel)
    static let viewModel = HomeViewModel()
    
    static var previews: some View {
        UIViewControllerPreview {
            viewController
        }
        .ignoresSafeArea()
        .allColorScheme(.lightModeFirst)
    }
    
}
#endif
