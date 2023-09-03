//
//  AuthenticationViewController.swift
//  NEOApp
//
//  Created by Sean Hong on 9/4/23.
//

import UIKit
import SnapKit
import Then
import RxSwift

class MainAuthenticationViewController: UIViewController {
    private let viewModel = MainAuthenticationViewModel()
    private let disposeBag = DisposeBag()

    private let contentView = UIView()

    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
    }

    private let logoImageView = UIImageView(image: UIImage(named: "Logo"))

    private let kakaoLoginButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "KakaoLogin"), for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
}

extension MainAuthenticationViewController {
    private func setUI() {
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        safeArea.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.width.centerX.top.bottom.equalToSuperview()
        }

        contentView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }

        contentView.addSubview(kakaoLoginButton)
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(200)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(56)
        }

        let apiFieldStack = UIStackView(arrangedSubviews: [kakaoLoginButton]).then {
            $0.axis = .horizontal
            $0.spacing = 28
            $0.distribution = .fillEqually
        }

        contentView.addSubview(apiFieldStack)
        apiFieldStack.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(200)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-10)
        }
    }

    private func bind() {
        bindInput()
        bindOutput()
    }

    private func bindInput() {
        kakaoLoginButton.rx.tap
            .bind(to: viewModel.input.kakaoLoginObserver)
            .disposed(by: disposeBag)
    }

    private func bindOutput() {
        viewModel.output.outputData.asDriver(onErrorJustReturn: (true, ""))
            .drive(onNext: { value in
                if value.0 {
                    // TODO: Navigate to SignUp Page
                } else {
                    // TODO: Navigate to Main View Container
                }
            })
            .disposed(by: disposeBag)

        viewModel.output.errorData.asDriver(onErrorJustReturn: "")
            .drive(onNext: { value in
                let alert = UIAlertController(title: "Error", message: value, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Confirm", style: .cancel)
                alert.addAction(cancelAction)
                self.present(alert, animated: true)
            }).disposed(by: disposeBag)
    }
}
