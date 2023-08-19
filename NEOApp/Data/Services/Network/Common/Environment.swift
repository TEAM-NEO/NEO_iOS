//
//  Environment.swift
//  NEOApp
//
//  Created by Sean Hong on 8/19/23.
//

import Foundation

enum Environment {
    case production
    case development
}

extension Environment {
    static var currentEnvironment: Environment {
        return .development
    }
}

extension Environment {
    static var baseURL: URL {
        switch Environment.currentEnvironment {
        case .production:
            return URL(string: BaseURL.production)!
        case .development:
            return URL(string: BaseURL.development)!
        }
    }
}

extension Environment {
    static var logging: Bool {
        switch(currentEnvironment) {
        case .production:
            return false
        case .development:
            return true
        }
    }
}
