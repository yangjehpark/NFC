//
//  TagInfoCell.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 4..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class TagInfoCell: UITableViewCell {
    
    static let defaultHeight: CGFloat = 30
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setup(_ key: String, _ value: String) {
        titleLabel?.text = key
        contentLabel?.text = value
    }
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var contentLabel: UILabel?
}

