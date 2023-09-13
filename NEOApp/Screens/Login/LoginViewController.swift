//
//  LoginViewController.swift
//  NEOApp
//
//  Created by Chanho on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let contentView = UIView()

    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
    }

    private let logoImageView = UIImageView(image: UIImage(named: "Logo"))
    
    private let loginTextFieldStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.distribution = .fillEqually
    }
    
    private let emailTextField = UITextField().then {
        $0.keyboardType = .emailAddress
        $0.textContentType = .emailAddress
        $0.frame = CGRect(x: 10, y: 20, width: 300, height: 60)
        $0.layer.cornerRadius = 5
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor.systemGray6
        $0.placeholder = "이메일"
        $0.setLeftImage(UIImage(systemName: "envelope"))
    }
    
    private let passwordTextField = UITextField().then {
        $0.textContentType = .password
        $0.frame = CGRect(x: 10, y: 20, width: 300, height: 60)
        $0.layer.cornerRadius = 5
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor.systemGray6
        $0.placeholder = "비밀번호"
        $0.setLeftImage(UIImage(systemName: "lock"))
    }

    private let loginButton = UIButton(type: .system).then {
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(named: "AccentColor")
        $0.layer.cornerRadius = 8
        $0.setTitle("로그인", for: .normal)
        
    }
    
    private lazy var signUpButton = UIButton(type: .system).then {
        $0.setAttributedTitle(
            NSAttributedString(
                string: "회원가입",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 14),
                    .underlineStyle: NSUnderlineStyle.single.rawValue
            ]), for: .normal)
        $0.addTarget(self, action: #selector(touchUpSignUpButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController {
    
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
        
        contentView.addSubview(loginTextFieldStack)
        loginTextFieldStack.addArrangedSubview(emailTextField)
        loginTextFieldStack.addArrangedSubview(passwordTextField)
        loginTextFieldStack.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.top.equalTo(loginTextFieldStack.snp.bottom).offset(20)
            $0.leading.equalTo(loginTextFieldStack.snp.leading)
            $0.trailing.equalTo(loginTextFieldStack.snp.trailing)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    @objc func touchUpSignUpButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
}
