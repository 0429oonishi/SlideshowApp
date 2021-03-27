//
//  FirstViewController.swift
//  SlideshowApp
//
//  Created by 大西玲音 on 2020/11/22.
//

import UIKit

final class FirstViewController: UIViewController {
    
    private var imageType: ImageType = .tanjirou
    private var timer: Timer?
    private var isPlay = false
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var moveButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var playOrStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.configure()
        moveButton.configure()
        backButton.configure()
        playOrStopButton.configure()
        self.view.setGradient()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animateImageView))
        imageView.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction private func moveButtonDidTapped(_ sender: Any) {
        moveImage(true)
        moveButton.animate()
    }
    
    
    @IBAction private func backImageButtonAction(_ sender: Any) {
        moveImage(false)
        backButton.animate()
    }
    
    @IBAction private func playOrStopButtonDidTapped(_ sender: Any) {
        playOrStopButton.animate()
        if isPlay {
            timer?.invalidate()
            moveButton.setEnable(true, 1)
            backButton.setEnable(true, 1)
            playOrStopButton.setTitle(ButtonType.play.title, for: .normal)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(showImage), userInfo: nil, repeats: true)
            moveButton.setEnable(false, 0.6)
            backButton.setEnable(false, 0.6)
            playOrStopButton.setTitle(ButtonType.stop.title, for: .normal)
        }
        isPlay.toggle()
    }
    
    @objc
    private func showImage() {
        moveImage(true)
    }
    
    private func moveImage(_ isMove: Bool) {
        imageType = isMove ? imageType.move() : imageType.back()
        imageView.image = UIImage(named: imageType.title)
    }
    
    @objc
    private func animateImageView() {
        guard !isPlay else { return }
        imageView.animate()
        showLargeImageVC()
    }
    
    private func showLargeImageVC() {
        let largeImageVC = UIStoryboard(name: "LargeImage", bundle: nil).instantiateViewController(identifier: "LargeImageViewController") as! LargeImageViewController
        largeImageVC.imageType = imageType
        present(largeImageVC, animated: true)
    }
    
}

