//
//  ViewController.swift
//  NEOApp
//
//  Created by Chanho on 2023/09/26.
//

import UIKit

class TypeSelectionViewController: UIViewController {
    
    // MARK: Instance
    private let contentView = UIView()

    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let starImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .systemYellow
    }
    
    private let fanImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(systemName: "heart.fill")
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .systemRed
    }
    
    private let starSelectLabel: UILabel = UILabel().then {
        $0.text = "스타로 시작하기"
        $0.textAlignment = .center
    }
    
    private let fanSelectLabel: UILabel = UILabel().then {
        $0.text = "팬으로 시작하기"
        $0.textAlignment = .center
    }
    
    private lazy var starStack: UIStackView = UIStackView().then {
        $0.addArrangedSubview(starImageView)
        $0.addArrangedSubview(starSelectLabel)
        
        starImageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
            make.top.leading.trailing.equalToSuperview()
        }
        
        starSelectLabel.snp.makeConstraints { make in
            make.top.equalTo(starImageView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 4
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchUpSelection)))
    }
    
    private lazy var fanStack: UIStackView = UIStackView().then {
        $0.addArrangedSubview(fanImageView)
        $0.addArrangedSubview(fanSelectLabel)
        
        fanImageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
        }
        
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 4
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchUpSelection)))
    }
    
    private lazy var selectionStack: UIStackView = UIStackView().then {
        $0.addArrangedSubview(starStack)
        $0.addArrangedSubview(fanStack)
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.spacing = 30
    }
    
    // MARK: Lifecycle
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

extension TypeSelectionViewController {
    
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
        
        contentView.addSubview(selectionStack)
        selectionStack.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        
    }
    
    @objc func touchUpSelection(_ sender: UIGestureRecognizer) {
        var selection: String
        
        switch sender.view {
        case starStack:
            selection = "Star"
        case fanStack:
            selection = "Fan"
        default:
            selection = "Unavailable Case"
        }
        
        self.navigationController?.pushViewController(FindStarViewController(selection: selection), animated: true)
    }
    
}
