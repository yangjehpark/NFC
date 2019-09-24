//
//  LocaleManager.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 4..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import Foundation

class LocaleManager {
    
    static let shared = LocaleManager()
    
    private let defaultLanguageCode: String = "en"
    
    enum SupportingLanguageCode: String {
        case english = "en"
        case korean = "ko"
        case japanese = "ja"
    }
    
    var currentBundle = Bundle.main
    
    init() {
        if let bundle = Bundle(path: getCurrentBundlePath()) {
            currentBundle = bundle
        }
    }
    
    private func getCurrentBundlePath() -> String {
        if let current = (Locale.current as NSLocale).object(forKey: .languageCode) as? String {
            return getPath(current)
        } else {
            return getPath(defaultLanguageCode)
        }
    }
    
    private func getPath(_ languageCode: String) -> String {
        let code = SupportingLanguageCode(rawValue: languageCode)?.rawValue ?? defaultLanguageCode
        if let path = Bundle.main.path(forResource: SupportingLanguageCode(rawValue: code)!.rawValue, ofType: "lproj") {
            return path
        } else {
            return Bundle.main.path(forResource: defaultLanguageCode, ofType: "lproj")!
        }
    }
}
