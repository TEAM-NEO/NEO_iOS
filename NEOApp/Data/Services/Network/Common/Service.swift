//
//  Service.swift
//  NEOApp
//
//  Created by Sean Hong on 8/19/23.
//

import Alamofire
import RxSwift

public protocol NetworkServiceProvidable: AnyObject {
    func execute<T: Codable>(_ urlRequest: URLRequestBuilder, model: T.Type) -> Single<T>
}

public extension NetworkServiceProvidable {
    func execute<T: Codable>(_ urlRequest: URLRequestBuilder, model: T.Type) -> Single<T> {
        return Single<T>.create { single in
            let request = AF.request(urlRequest)
            let disposable = request.validate().responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    single(.success(value))
                case .failure(let error):
                    single(.failure(error))
                }
            }
            
            return Disposables.create {
                disposable.cancel()
            }
        }
    }
}

public class NetworkService: NetworkServiceProvidable {
    public static let `default`: NetworkServiceProvidable = {
        var service = NetworkService()
        return service
    }()
}
