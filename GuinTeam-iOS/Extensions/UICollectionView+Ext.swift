//
//  UICollectionView+Ext.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 3/1/24.
//

import UIKit
import RxSwift
import RxCocoa

extension UICollectionView {
    
    private func getIdentifier(from cell: UICollectionViewCell.Type) -> String {
        "\(cell)"
    }
    
    func register(from cell: UICollectionViewCell.Type) {
        let identifier = getIdentifier(from: cell)
        register(cell, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(from cell: Cell.Type, for indexPath: IndexPath) -> Cell? {
        dequeueReusableCell(withReuseIdentifier: getIdentifier(from: cell), for: indexPath) as? Cell
    }
    
    func rxItems<Sequence: Swift.Sequence, Cell: UICollectionViewCell, Source: ObservableType> (cellType: Cell.Type)
    -> (_ source: Source)
    -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
    -> Disposable
    where Source.Element == Sequence {
        rx.items(cellIdentifier: getIdentifier(from: cellType), cellType: cellType)
    }
    
}
