//
//  SignUpViewController.swift
//  NEOApp
//
//  Created by Chanho on 2023/09/13.
//

import UIKit

class SignUpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    let signUpProperties: [String] = ["이메일*", "비밀번호*", "비밀번호 확인*", "닉네임", "성별", "생년월일"]
    let identifier: String = "SignUpCell"
    
    let contentView: UIView = UIView()
    
    private let scrollView: UIScrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
    }
    
    private lazy var signUpTableView: UITableView = UITableView().then {
        $0.dataSource = self
        $0.delegate = self
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpTableView.register(SignUpTableViewCell.self, forCellReuseIdentifier: identifier)
        
        setUI()
    }
    
    // MARK: Setup TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath)
//        
//        // UITableViewCell은 커스텀 예정
//        var contentConfiguration = cell.defaultContentConfiguration()
//        contentConfiguration.text = signUpProperties[indexPath.row]
//        
//        cell.contentConfiguration = contentConfiguration
        
        guard let cell: SignUpTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? SignUpTableViewCell else {
            return UITableViewCell()
        }
        
        cell.bind(title: signUpProperties[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signUpProperties.count
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

extension SignUpViewController {
    
    func setUI() {
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        safeArea.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.width.height.equalToSuperview()
        }
        
        contentView.addSubview(signUpTableView)
        signUpTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
