//
//  String.swift
//  FineDust
//
//  Created by USER on 2018. 3. 8..
//  Copyright © 2018년 USER. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        let error = "Can't be localized."
        let result = Bundle.main.localizedString(forKey: self, value: error, table: nil)
        if result == error {
            log(error+"(The key is not found)")
            return self
        } else {
            return result
        }
    }
}
