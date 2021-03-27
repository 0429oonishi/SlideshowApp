//
//  UIButton+Extension.swift
//  SlideshowApp
//
//  Created by 大西玲音 on 2021/03/27.
//

import UIKit

extension UIButton {
    
    func setEnable(_ isEnabled: Bool, _ alpha: CGFloat) {
        self.isEnabled = isEnabled
        self.alpha = alpha
    }
    
    func configure() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: shadowLength, height: shadowLength)
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = 4
    }
    
    func animate() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
            self.layer.shadowOpacity = 0
            self.transform = CGAffineTransform(translationX: shadowLength, y: shadowLength)
        }) { _ in
            self.layer.shadowOpacity = shadowOpacity
            self.transform = .identity
        }
    }
    
}
