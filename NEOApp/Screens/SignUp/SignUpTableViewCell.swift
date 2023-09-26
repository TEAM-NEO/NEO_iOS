//
//  TableViewCell.swift
//  NEOApp
//
//  Created by Chanho on 2023/09/26.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {

    //MARK: Properties
    private let titleLabel: UILabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    private let inputTextField: UITextField = UITextField().then {
        $0.placeholder = "내용을 입력하세요."
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    private lazy var stackView: UIStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.addArrangedSubview(titleLabel)
        $0.addArrangedSubview(inputTextField)
    }
    
    //MARK: initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: Setup UI
    func setUI() {
                
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        inputTextField.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
}

extension SignUpTableViewCell {
    
    // MARK: Bind Value
    func bind(title: String) {
        titleLabel.text = title
    }
    
}
