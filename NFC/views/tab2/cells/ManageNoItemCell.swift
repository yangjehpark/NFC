//
//  ManageNoItemCell.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 2..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class ManageNoItemCell: UITableViewCell {
    
    static let defaultHeight: CGFloat = Util.commonContentViewHeight
    
    @IBOutlet weak var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLabel?.text = "No Item!"
    }
}
