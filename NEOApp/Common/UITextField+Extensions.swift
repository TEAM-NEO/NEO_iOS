//
//  UITextField+Extensions.swift
//  NEOApp
//
//  Created by Chanho on 2023/09/13.
//

import UIKit

extension UITextField {
    
    func setLeftImage(_ image: UIImage?) {
        let padding = 8
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: 20 + padding, height: 20))
        let imageView = UIImageView(frame: CGRect(x: padding, y: 0, width: 20, height: 20))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        outerView.addSubview(imageView)
        self.leftView = outerView
        self.leftViewMode = .always
    }
}
