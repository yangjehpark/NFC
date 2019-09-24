//
//  CardCell.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 2..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
 
    static let defaultSize = CGSize(width: Util.screenWidth, height: Util.screenHeight*3/5)
    let defaultCornerRadius: CGFloat = 15.0
 
    var cardIndex: Int = 0
    @IBOutlet weak var cardView: UIView!
    let cardViewGradientLayer = CAGradientLayer()
    @IBOutlet var margins: [NSLayoutConstraint]!
    var isActive = false
    var cardColor = UIColor.white
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = defaultCornerRadius
        cardView.layer.addSublayer(cardViewGradientLayer)
    }
    
    func setup(_ index: Int, _ color: UIColor) {
        cardIndex = index
        cardColor = color
        setGradation(cardColor)
    }
    
    private func setGradation(_ color: UIColor) {
        layoutIfNeeded()
        cardViewGradientLayer.frame.size = cardView.frame.size
        cardViewGradientLayer.colors = [UIColor.white.cgColor, color.withAlphaComponent(1).cgColor]
        cardViewGradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        cardViewGradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        cardViewGradientLayer.cornerRadius = defaultCornerRadius
    }
    
    func activate(_ active: Bool) {
        isActive = active
        if isActive {
            NFCManager.shared.sendStart()
        } else {
            NFCManager.shared.sendFinish()
        }
        extendCardView(isActive)
    }
    
    private func extendCardView(_ extend: Bool) {
        UIView.animate(withDuration: 0.5) {
            for margin in self.margins {
                if extend {
                    margin.constant = 0
                } else {
                    margin.constant = 20
                }
            }
            self.setGradation(self.cardColor)
        }
    }
    
}
