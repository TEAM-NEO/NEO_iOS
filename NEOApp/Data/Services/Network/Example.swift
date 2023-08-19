//
//  Example.swift
//  NEOApp
//
//  Created by Sean Hong on 8/19/23.
//

import Alamofire

enum Example: URLRequestBuilder {
    case fetch(Void)
    case create(Void)
    case update(Void)
    case delete(Void)
}

extension Example {
    var path: String {
        switch self {
        case .fetch():
            return "/example"
        case .create():
            return "/example"
        case .update():
            return "/example"
        case .delete():
            return "/example"
        }
    }
    
}

extension Example {
    var parameters: Alamofire.Parameters? {
        switch self {
        case .fetch():
            return [:]
        case .create():
            return [:]
        case .update():
            return [:]
        case .delete():
            return [:]
        }
    }
}

extension Example {
    var method: Alamofire.HTTPMethod {
        switch self {
        case .fetch():
            return .get
        case .create():
            return .post
        case .update():
            return .patch
        case .delete():
            return .delete
        }
    }
}
