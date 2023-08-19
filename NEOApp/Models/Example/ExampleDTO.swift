//
//  ExampleDTO.swift
//  NEOApp
//
//  Created by Sean Hong on 8/19/23.
//

import Foundation

struct ExampleDTO: Decodable {
    let id: Int
    let name: String
    let description: String
    
    func of() -> ExampleModel {
        return ExampleModel(
            id: id,
            name: name,
            description: description
        )
    }
}
