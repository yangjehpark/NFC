//
//  UITableView.swift
//  BitMax
//
//  Created by USER on 2018. 3. 5..
//  Copyright © 2018년 USER. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ type: T.Type, _ index: Int? = nil) {
        register(UINib(nibName: type.className, bundle: nil), forCellReuseIdentifier: type.className+(index != nil ? String(index!) : ""))
    }
    
    func registerCells<T: UITableViewCell>(_ types: [T.Type]) {
        types.forEach { registerCell($0) }
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ type: T.Type) {
        register(UINib(nibName: type.className, bundle: nil), forHeaderFooterViewReuseIdentifier: type.className)
    }
    
    func registerHeaderFooterViews<T: UITableViewHeaderFooterView>(_ types: [T.Type]) {
        types.forEach { registerHeaderFooterView($0) }
    }
    
    func dequeueCell<T: UITableViewCell>(_ type: T.Type, _ indexPath: IndexPath, _ index: Int? = nil) -> T? {
        return self.dequeueReusableCell(withIdentifier: type.className+(index != nil ? String(index!) : ""), for: indexPath) as? T
    }
    
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: type.className) as? T
    }
    
    func reloadDataWithoutScrolling() {
        reloadWithoutAnimationAndScrolling {
            self.reloadData()
        }
    }
    
    func reloadRowsWithoutScrolling(at: [IndexPath], with: UITableViewRowAnimation) {
        reloadWithoutAnimationAndScrolling {
            self.reloadRows(at: at, with: with)
        }
    }
    
    func reloadSectionsWithoutScrolling(sections: IndexSet, with: UITableViewRowAnimation) {
        reloadWithoutAnimationAndScrolling {
            self.reloadSections(sections, with: with)
        }
    }
    
    private func reloadWithoutAnimationAndScrolling(closure: ()->()) {
        let offset = self.contentOffset
        UIView.performWithoutAnimation {
            closure()
        }
        self.layoutIfNeeded()
        self.setContentOffset(offset, animated: false)
    }
}

extension UICollectionView {
    
    // Register
    
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        self.register(UINib(nibName: type.className, bundle: nil), forCellWithReuseIdentifier: type.className)
    }
    
    func registerCells<T: UICollectionViewCell>(_ types: [T.Type]) {
        types.forEach { registerCell($0) }
    }
    
    func registerSectionHeaderView<T: UICollectionReusableView>(_ type: T.Type) {
        self.register(UINib(nibName: type.className, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: type.className)
    }
    
    func registerSectionFooterView<T: UICollectionReusableView>(_ type: T.Type) {
        self.register(UINib(nibName: type.className, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: type.className)
    }
    
    // Dequeue
    
    func dequeueCell<T: UICollectionViewCell>(_ type: T.Type, _ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueHeaderView<T: UICollectionReusableView>(_ type: T.Type, _ indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueFooterView<T: UICollectionReusableView>(_ type: T.Type, _ indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    // Get
    func getCell<T: UICollectionViewCell>(_ type: T.Type, _ indexPath: IndexPath) -> T? {
        return self.cellForItem(at: indexPath) as? T
    }
    
    func getHeaderView<T: UICollectionReusableView>(_ type: T.Type, _ section: Int) -> T? {
        return self.supplementaryView(forElementKind: UICollectionElementKindSectionHeader, at: IndexPath(item: 0, section: section)) as? T
    }
    
    func getFooterView<T: UICollectionReusableView>(_ type: T.Type, _ section: Int) -> T? {
        return self.supplementaryView(forElementKind: UICollectionElementKindSectionFooter, at: IndexPath(item: 0, section: section)) as? T
    }

}
