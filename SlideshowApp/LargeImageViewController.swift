//
//  LargeImageViewController.swift
//  SlideshowApp
//
//  Created by 大西玲音 on 2020/11/22.
//

import UIKit

class LargeImageViewController: UIViewController {

    @IBOutlet weak var LargeImage: UIImageView!
    @IBOutlet weak var moveBackButton: UIButton!
    var ButtonTappedCount = 0
    let buttonShadowLength: CGFloat = 2
    let shadowOpacity: Float = 0.8
    var dismissTime: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesSlide()
        gradient()
        buttonStyle()
        imageStyle(imageName: LargeImage)
    }

    @IBAction func backButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
            self.moveBackButton.layer.shadowOpacity = 0
            self.moveBackButton.transform = CGAffineTransform(translationX: self.buttonShadowLength, y: self.buttonShadowLength)
        }) {_ in
            self.moveBackButton.layer.shadowOpacity = self.shadowOpacity
            self.moveBackButton.transform = .identity
        }
        dismissTime = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(dismissAction), userInfo: nil, repeats: false)
    }
    
    @objc func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func imagesSlide() {
        switch ButtonTappedCount {
        case 0, 6, -6:
            LargeImage.image = UIImage(named: "tanjirou")
            ButtonTappedCount = 0
        case 1, -5:
            LargeImage.image = UIImage(named: "tomioka")
        case 2, -4:
            LargeImage.image = UIImage(named: "zenitu")
        case 3, -3:
            LargeImage.image = UIImage(named: "muzan")
        case 4, -2:
            LargeImage.image = UIImage(named: "rengoku")
        case 5, -1:
            LargeImage.image = UIImage(named: "teoni")
        default:
            print("error")
        }
    }
    
    func gradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        gradientLayer.colors = [UIColor(red: 0.6, green: 0.0, blue: 0.70, alpha: 1).cgColor,
                                UIColor(red: 0.2, green: 0.0, blue: 0.20, alpha: 0.9).cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0.5)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func buttonStyle() {
        moveBackButton.layer.cornerRadius = 10
        moveBackButton.layer.shadowColor = UIColor.black.cgColor
        moveBackButton.layer.shadowOffset = CGSize(width: buttonShadowLength, height: buttonShadowLength)
        moveBackButton.layer.shadowOpacity = shadowOpacity
        moveBackButton.layer.shadowRadius = 4
    }
    
    func imageStyle(imageName image: UIImageView) {
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.masksToBounds = false
        image.layer.shadowOffset = CGSize(width: buttonShadowLength * 2, height: buttonShadowLength * 3)
        image.layer.shadowOpacity = shadowOpacity
        image.layer.shadowRadius = 4
    }
    
    
    
    
}
