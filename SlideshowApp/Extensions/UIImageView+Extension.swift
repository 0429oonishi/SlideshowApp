//
//  UIImageView+Extension.swift
//  SlideshowApp
//
//  Created by 大西玲音 on 2021/03/27.
//

import UIKit

extension UIImageView {
    
    func configure() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: shadowLength * 2, height: shadowLength * 2)
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = 4
    }
    
    func animate() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
            self.layer.masksToBounds = true
            self.transform = CGAffineTransform(translationX: shadowLength, y: shadowLength)
        }) { _ in
            self.layer.masksToBounds = false
            self.transform = .identity
        }
    }

}
