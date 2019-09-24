//
//  Utils.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 2..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class Util {
    
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var commonContentViewHeight: CGFloat {
        let commonStatusBarHeight: CGFloat = 20
        let commonNavigationBarHeight: CGFloat = 44
        let commonTabBarHeight: CGFloat = 44
        return UIScreen.main.bounds.height-commonStatusBarHeight-commonNavigationBarHeight-commonTabBarHeight
    }
    
    static var cardGoldenRatio: CGFloat {
        return 1.618
    }
    
    static var colorMain: UIColor {
        return UIColor(r: 71, g: 165, b: 209)
    }
}
