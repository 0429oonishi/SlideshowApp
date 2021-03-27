//
//  UIView+Extension.swift
//  SlideshowApp
//
//  Created by 大西玲音 on 2021/03/27.
//

import UIKit

extension UIView {
    
    func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        gradientLayer.colors = [UIColor(red: 0.8, green: 0.0, blue: 0.73, alpha: 1).cgColor,
                                UIColor(red: 0.1, green: 0.0, blue: 0.40, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

