//
//  Helpers.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 1..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit
import AudioToolbox

class StoryboardHelper {
    
    static func getVC(_ vc: UIViewController.Type) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vc.className)
    }
}

class AlertHelper {
    
    static func showCancelAlert(_ vc: UIViewController, completionHandler: @escaping (_ cancel: Bool) -> Void) {
        let alert = UIAlertController(title: "Do you wanna cancel?", message: "", preferredStyle: .alert)
        alert.view.tintColor = Util.colorMain
        alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: { (alertAction:UIAlertAction) in
            completionHandler(false)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (alertAction:UIAlertAction) in
            completionHandler(true)
        }))
        vc.present(alert, animated: true) {
            log("showCancelAlert")
        }
    }
}

class DeviceHelper {
    
    static func tagBeep() {
        let systemSoundID: SystemSoundID = 1050
        AudioServicesPlaySystemSound(systemSoundID)
    }
    
    static func vibrate() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }

}
