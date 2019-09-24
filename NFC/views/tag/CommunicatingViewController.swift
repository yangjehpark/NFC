//
//  CommunicatingViewController.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 1..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class CommunicatingViewController: AddViewController {
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var communicatingAnimationImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        communicatingAnimationImageView.image = UIImage.gif(asset: "loading_animation_circle")
        #if DEBUG
            communicatingAnimationImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(test))
            communicatingAnimationImageView.addGestureRecognizer(tap)
        #endif
    }
}
