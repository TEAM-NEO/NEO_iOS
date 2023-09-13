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
    
    let loginButtonStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    lazy var emailLoginButton = UIButton(type: .system).then {
        $0.backgroundColor = .systemGray6
        $0.setTitle("이메일 로그인", for: .normal)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(touchUpEmailLoginButton), for: .touchUpInside)
    }
    
    private let kakaoLoginButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "KakaoLogin"), for: .normal)
    }

    private let emailTextField: UITextField = UITextField().then {
        $0.placeholder = "이메일"
        $0.largeContentImage = UIImage(named: "envelope")
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
            $0.edges.width.height.equalToSuperview()
        }

        contentView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(loginButtonStack)
        loginButtonStack.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(128)
            $0.centerX.equalToSuperview()
        }
        
        loginButtonStack.addArrangedSubview(emailLoginButton)
        loginButtonStack.addArrangedSubview(kakaoLoginButton)
        
        emailLoginButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        kakaoLoginButton.snp.makeConstraints {
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
    
    @objc func touchUpEmailLoginButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(LoginViewController(), animated: false)
    }
    
}
