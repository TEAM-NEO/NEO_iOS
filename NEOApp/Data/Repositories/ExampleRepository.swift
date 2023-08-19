//
//  ExampleRepository.swift
//  NEOApp
//
//  Created by Sean Hong on 8/19/23.
//

import Foundation
import Alamofire

protocol ExampleRepositoryProviding {
    func fetchExample(completion: @escaping (Result<ExampleDTO, AFError>) -> Void)
    func createExample(completion: @escaping (Result<ExampleDTO, AFError>) -> Void)
    func updateExample(completion: @escaping (Result<ExampleDTO, AFError>) -> Void)
    func deleteExample(completion: @escaping (Result<ExampleDTO, AFError>) -> Void)
}

final class ExampleRepository {
    private let networkService: NetworkServiceProvidable

    init(networkService: NetworkServiceProvidable = NetworkService.default) {
        self.networkService = networkService
    }
}

extension ExampleRepository: ExampleRepositoryProviding {
    func fetchExample(completion: @escaping (Result<ExampleDTO, Alamofire.AFError>) -> Void) {

    }

    func createExample(completion: @escaping (Result<ExampleDTO, Alamofire.AFError>) -> Void) {

    }

    func updateExample(completion: @escaping (Result<ExampleDTO, Alamofire.AFError>) -> Void) {

    }

    func deleteExample(completion: @escaping (Result<ExampleDTO, Alamofire.AFError>) -> Void) {

    }

}
