//
//  ExampleNetworkService.swift
//  NEOApp
//
//  Created by Sean Hong on 8/19/23.
//

import Foundation
import Alamofire
import RxSwift
import os

protocol ExampleServiceProvidable {
    func fetchExamples()
    func fetchExample(name: String)
    func createExample(name: String, description: String)
    func updateExample(name: String, description: String)
    func updateExample(name: String)
    func updateExample(description: String)
    func deleteExample(name: String)
}

final class ExampleService {
    private let network: NetworkServiceProvidable
    private let bag: DisposeBag = DisposeBag()

    private let logger = Logger(subsystem: "NeoApp", category: "ExampleService")

    init(network: NetworkServiceProvidable = NetworkService.default) {
        self.network = network
    }
}

extension ExampleService: ExampleServiceProvidable {
    func fetchExamples() {
        network
            .execute(
                ExampleRequest.fetchExamples,
                model: ExampleDTO.self
            )
            .subscribe(
                onSuccess: { (response) in
                    self.logger.log("[Success] name: \(response.name) description: \(response.description)")
                }, onFailure: { (error) in
                    self.logger.error("[Failed] network failure \(error.localizedDescription)")
                })
            .disposed(by: bag)
    }

    func fetchExample(name: String) {
        network
            .execute(
                ExampleRequest.fetchExample(name: name),
                model: ExampleDTO.self
            )
            .subscribe(
                onSuccess: { (response) in
                    self.logger.log("[Success] name: \(response.name) description: \(response.description)")
                }, onFailure: { (error) in
                    self.logger.error("[Failed] network failure \(error.localizedDescription)")
                })
            .disposed(by: bag)
    }

    func createExample(name: String, description: String) {
        network
            .execute(
                ExampleRequest.createExample(name: name, description: description),
                model: ExampleDTO.self
            )
            .subscribe(
                onSuccess: { (response) in
                    self.logger.log("[Success] name: \(response.name) description: \(response.description)")
                }, onFailure: { (error) in
                    self.logger.error("[Failed] network failure \(error.localizedDescription)")
                })
            .disposed(by: bag)
    }

    func updateExample(name: String, description: String) {
        network
            .execute(
                ExampleRequest.createExample(name: name, description: description),
                model: ExampleDTO.self)
            .subscribe(
                onSuccess: { (response) in
                    self.logger.log("[Success] name: \(response.name) description: \(response.description)")
                }, onFailure: { (error) in
                    self.logger.error("[Failed] network failure \(error.localizedDescription)")
                })
            .disposed(by: bag)
    }

    func updateExample(name: String) {
        network
            .execute(
                ExampleRequest.updateExampleName(name),
                model: ExampleDTO.self
            )
            .subscribe(
                onSuccess: { (response) in
                    self.logger.log("[Success] name: \(response.name) description: \(response.description)")
                }, onFailure: { (error) in
                    self.logger.error("[Failed] network failure \(error.localizedDescription)")
                })
            .disposed(by: bag)
    }

    func updateExample(description: String) {
        network
            .execute(
                ExampleRequest.updateExampleDescription(description),
                model: ExampleDTO.self
            )
            .subscribe(
                onSuccess: { (response) in
                    self.logger.log("[Success] name: \(response.name) description: \(response.description)")
                }, onFailure: { (error) in
                    self.logger.error("[Failed] network failure \(error.localizedDescription)")
                })
            .disposed(by: bag)
    }

    func deleteExample(name: String) {
        network
            .execute(
                ExampleRequest.deleteExample(name: name),
                model: ExampleDTO.self
            )
            .subscribe(
                onSuccess: { (response) in
                    self.logger.log("[Success] name: \(response.name) description: \(response.description)")
                }, onFailure: { (error) in
                    self.logger.error("[Failed] network failure \(error.localizedDescription)")
                })
            .disposed(by: bag)
    }

}
