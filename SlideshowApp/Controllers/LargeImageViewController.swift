//
//  LargeImageViewController.swift
//  SlideshowApp
//
//  Created by 大西玲音 on 2020/11/22.
//

import UIKit

final class LargeImageViewController: UIViewController {
    
    @IBOutlet private weak var largeImage: UIImageView!
    @IBOutlet private weak var backButton: UIButton!
    
    var imageType: ImageType = .tanjirou
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        largeImage.configure()
        backButton.configure()
        backButton.layer.cornerRadius = 10
        self.view.setGradient()
        
        largeImage.image = UIImage(named: imageType.title)
    }

    @IBAction private func backButtonDidTapped(_ sender: Any) {
        backButton.animate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.dismiss(animated: true, completion: nil)
        }
    }
        
}
