//
//  Bundle+Extensions.swift
//  NEOApp
//
//  Created by Sean Hong on 9/4/23.
//

import Foundation

extension Bundle {
    var kakaoAPIKey: String {
        guard let filePath = Bundle.main.path(forResource: "BASE-Keys", ofType: "plist"),
              let plistDict = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't find file 'BASE-Keys.plist'.")
        }

        guard let value = plistDict.object(forKey: "KAKAO_API_KEY") as? String else {
            fatalError("Couldn't find key 'API_Key' in 'BASE-Keys.plist'.")
        }

        return value
    }
}
