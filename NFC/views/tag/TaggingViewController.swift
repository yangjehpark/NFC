//
//  TaggingViewController.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 1..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class TaggingViewController: AddViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var tagAnimationImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cancelButton.setTitle("Cancel", for: .normal)
        NFCManager.shared.readStart()
        tagAnimationImageView.image = UIImage.gif(asset: "nfc_animation_tag")
        #if DEBUG
            tagAnimationImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(test))
            tagAnimationImageView.addGestureRecognizer(tap)
        #endif
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NFCManager.shared.readFinish()
    }
    
    @IBAction func cancelButtonPressed(sender: UIButton) {
        sender.isEnabled = false
        AlertHelper.showCancelAlert(self) { (cancel:Bool) in
            if cancel {
                self.fail()
            } else {
                sender.isEnabled = true
            }
        }
    }
    
    override func test() {
        super.test()
        DeviceHelper.tagBeep()
        DeviceHelper.vibrate()
    }
}
