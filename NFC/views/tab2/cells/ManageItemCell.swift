//
//  ManageItemCell.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 2..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class ManageItemCell: UITableViewCell {
    
    static let defaultHeight: CGFloat = 100
    
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var subTextLabel: UILabel!
    @IBOutlet weak var thumnailCardView: UIView!
    let thumnailCardViewGradientLayer = CAGradientLayer()
    var thumnailCardColor = UIColor.white
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        thumnailCardView.layer.masksToBounds = true
        thumnailCardView.layer.cornerRadius = 5
        thumnailCardView.layer.addSublayer(thumnailCardViewGradientLayer)
    }
    
    func setup(_ color: UIColor) {
        thumnailCardColor = color
        setGradation(color)
    }
    
    private func setGradation(_ color: UIColor) {
        layoutIfNeeded()
        thumnailCardViewGradientLayer.frame.size = thumnailCardView.frame.size
        thumnailCardViewGradientLayer.colors = [UIColor.white.cgColor, color.withAlphaComponent(1).cgColor]
        thumnailCardViewGradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        thumnailCardViewGradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
}
