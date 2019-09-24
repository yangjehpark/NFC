//
//  NSObject.swift
//  FineDust
//
//  Created by USER on 2018. 3. 5..
//  Copyright © 2018년 USER. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
