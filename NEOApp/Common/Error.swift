//
//  Error.swift
//  NEOApp
//
//  Created by Sean Hong on 9/4/23.
//

import Foundation

struct NeoError: Error {
    var code: Int
    var msg: String
}
