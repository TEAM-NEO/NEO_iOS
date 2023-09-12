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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
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
        view.backgroundColor = UIColor(red: 124, green: 1, blue: 1, alpha: 1)
        
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
    }
    
    private func setNavigationBar() {
//        self.navigationController?.isNavigationBarHidden = true
    }
}
