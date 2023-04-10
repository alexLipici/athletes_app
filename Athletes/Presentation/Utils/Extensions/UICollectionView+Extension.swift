//
//  UICollectionView+Extension.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit
import Reusable

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    
    final func register<T: UICollectionViewCell>(cell: T.Type) {
        register(cell.self, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }
    
    final func register<T: UICollectionViewCell>(cellType: T.Type)
    where T: Reusable & NibLoadable {
        self.register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
}
