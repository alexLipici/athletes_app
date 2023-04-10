//
//  UITableView+Extension.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit

extension UITableViewHeaderFooterView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    final func register<T: UITableViewCell>(nibCell: T.Type) {
        let nib = UINib(nibName: nibCell.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: nibCell.reuseIdentifier)
    }
    
    final func register<T: UITableViewCell>(cell: T.Type) {
        register(cell.self, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    final func registerHeaderFooterView<T: UITableViewHeaderFooterView>(view: T.Type) {
        register(view.self, forHeaderFooterViewReuseIdentifier: view.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
    
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(view: T.Type = T.self) -> T {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: view.reuseIdentifier) as? T else {
            fatalError(
                "Failed to dequeue a view with identifier \(view.reuseIdentifier) matching type \(view.self). "
                + "Check that the reuseIdentifier is set properly and that you registered the cell beforehand"
            )
        }
        return view
    }
}
