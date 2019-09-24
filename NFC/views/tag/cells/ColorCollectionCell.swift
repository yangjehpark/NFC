//
//  ColorCollectionCell.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 4..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class ColorCollectionCell: UICollectionViewCell {
    
    static var defaultSize: CGSize {
        let sideMargin: CGFloat = 20
        let numberOfCellInRow = CGFloat(AddFinalViewController.numberOfCellInRow)
        let cellWidth = ((Util.screenWidth-(sideMargin*2)) - (numberOfCellInRow-1)*AddFinalViewController.minimumSpace)/numberOfCellInRow
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    let defaultCornerRadius: CGFloat = 5.0
    var cardIndex: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = defaultCornerRadius
    }
    
    func setup(_ color: UIColor) {
        backgroundColor = color
    }
    
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            if isSelected {
                layer.borderColor = UIColor.black.cgColor
            } else {
                layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
}
