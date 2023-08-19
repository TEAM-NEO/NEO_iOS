//
//  ExampleRequest.swift
//  NEOApp
//
//  Created by Sean Hong on 8/19/23.
//

import Alamofire

enum ExampleRequest: URLRequestBuilder {
    case fetchExamples
    case fetchExample(name: String)
    case createExample(name: String, description: String)
    case updateExample(name: String, description: String)
    case updateExampleName(_ name: String)
    case updateExampleDescription(_ description: String)
    case deleteExample(name: String)
}

extension ExampleRequest {
    var path: String {
        switch self {
        case .fetchExamples:
            return "/example"
        case .fetchExample(name: let name):
            return "/example/query?name=\(name)"
        case .createExample:
            return "/example"
        case .updateExample:
            return "/example"
        case .updateExampleName:
            return "/example"
        case .updateExampleDescription:
            return "/example"
        case .deleteExample:
            return "/example"
        }
    }

}

// TODO: DTO -> Parameters
extension ExampleRequest {
    var parameters: Alamofire.Parameters? {
        switch self {
        case .fetchExamples:
            return [:]
        case .fetchExample:
            return [:]
        case .createExample(name: let name, description: let description):
            return ["name": name, "description": description]
        case .updateExample(name: let name, description: let description):
            return ["name": name, "description": description]
        case .updateExampleName(name: let name):
            return ["name": name]
        case .updateExampleDescription(description: let description):
            return ["description": description]
        case .deleteExample(name: let name):
            return ["name": name]
        }
    }
}

extension ExampleRequest {
    var method: Alamofire.HTTPMethod {
        switch self {
        case .fetchExamples:
            return .get
        case .fetchExample:
            return .get
        case .createExample:
            return .post
        case .updateExample:
            return .patch
        case .updateExampleName:
            return .patch
        case .updateExampleDescription:
            return .patch
        case .deleteExample:
            return .delete
        }
    }
}
