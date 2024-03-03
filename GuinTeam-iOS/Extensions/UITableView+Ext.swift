//
//  UITableView+Ext.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 2/17/24.
//

import UIKit
import RxSwift
import RxCocoa

extension UITableView {
    
    private func getIdentifier(from cell: UITableViewCell.Type) -> String {
        "\(cell)"
    }
    
    func register(from cell: UITableViewCell.Type) {
        let identifier = getIdentifier(from: cell)
        register(cell, forCellReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(from cell: Cell.Type) -> Cell? {
        dequeueReusableCell(withIdentifier: getIdentifier(from: cell)) as? Cell
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(from cell: Cell.Type, for indexPath: IndexPath) -> Cell? {
        dequeueReusableCell(withIdentifier: getIdentifier(from: cell), for: indexPath) as? Cell
    }
    
    func rxItems<Sequence: Swift.Sequence, Cell: UITableViewCell, Source: ObservableType> (cellType: Cell.Type)
    -> (_ source: Source)
    -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
    -> Disposable
    where Source.Element == Sequence {
        rx.items(cellIdentifier: getIdentifier(from: cellType), cellType: cellType)
    }
    
} 
