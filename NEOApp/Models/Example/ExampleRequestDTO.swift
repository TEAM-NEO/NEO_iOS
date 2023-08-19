//
//  ExampleRequestDTO.swift
//  NEOApp
//
//  Created by Sean Hong on 8/19/23.
//

import Foundation

struct ExampleRequestDTO: Encodable {
    let name: String
    let description: String
}

extension ExampleRequestDTO {
    init(model: ExampleModel) {
        self.name = model.name
        self.description = model.description
    }
}
