//
//  MainAuthenticationViewModel.swift
//  NEOApp
//
//  Created by Sean Hong on 9/4/23.
//

import Foundation
import RxSwift
import RxCocoa
import RxKakaoSDKAuth
import KakaoSDKAuth
import RxKakaoSDKUser
import KakaoSDKUser
import RxAlamofire
import Alamofire
import os

class MainAuthenticationViewModel {
    private let logger = Logger(subsystem: "com.NEO.NEOApp", category: "MainAuthenticationViewModel")
    let input = Input()
    let output = Output()
    let disposeBag = DisposeBag()

    struct Input {
        let kakaoLoginObserver = PublishRelay<Void>()
    }

    struct Output {
        let outputData = PublishRelay<(Bool, String)>()
        let errorData = PublishRelay<String>()
    }

    init() {
        input.kakaoLoginObserver
            .flatMap(kakaoAuth)
            .subscribe(onNext: { result in
                if let error = result.error {
                    self.output.errorData.accept(error.msg)
                } else if let token = result.success as? (Bool, String) {
                    self.output.outputData.accept(token)
                }
            })
            .disposed(by: disposeBag)
    }

    /**
     카카오로 로그인 할 때 실행
     > 회원가입 유무 확인 후 회원가입 페이지 or 메인화면으로 이동
     - Parameters:None
     - Throws: MellyError
     - Returns:User
     */
    func kakaoAuth() -> Observable<Response> {
        logger.debug("ViewModel")
        return Observable.create { observer in
            var result = Response()
            if UserApi.isKakaoTalkLoginAvailable() {
                UserApi.shared.rx.loginWithKakaoTalk()
                    .subscribe { event in
                        switch event {
                        case .next:
                            // TODO: Check if user has already signed up
                            break
                        case .completed:
                            self.logger.debug("Completed")
                            break
                        case .error:
                            let error = NeoError(code: 1, msg: "Check network state.")
                            result.error = error
                            observer.onNext(result)
                        }
                    }
                    .disposed(by: self.disposeBag)
            } else {
                UserApi.shared.rx.loginWithKakaoAccount()
                    .subscribe { event in
                        switch event {
                        case .next:
                            // TODO: Check if user has already signed up
                            break
                        case .completed:
                            self.logger.debug("Completed")
                            break
                        case .error:
                            let error = NeoError(code: 2, msg: "Check network state.")
                            result.error = error
                            observer.onNext(result)
                        }
                    }
                    .disposed(by: self.disposeBag)
            }

            return Disposables.create()
        }
    }
}
