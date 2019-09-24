//
//  UserDataManager.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 1..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import Foundation

class UserDataManager {
    
    static let shared = UserDataManager()
    
    private var data = [String]()
    
    var dataCount: Int {
        return 5
    }
    
    func sync() {
        
    }
}
