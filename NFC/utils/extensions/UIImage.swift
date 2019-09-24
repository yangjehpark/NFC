//
//  UIImage.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 2..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import Foundation
import SwiftGifOrigin

extension UIImage {
    // dependency to SwiftGifOrigin
    public class func gif(asset: String) -> UIImage? {
        if let asset = NSDataAsset(name: asset) {
            return UIImage.gif(data: asset.data)
        }
        return nil
    }
}
