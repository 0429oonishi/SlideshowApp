


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextImageButton: UIButton!
    @IBOutlet weak var backImageButton: UIButton!
    @IBOutlet weak var saiseiOrTeishiButton: UIButton!
    var ButtonTappedCount = 0
    var timer: Timer?
    var saiseiOrTeishiFlag = false //saiseiならtrue
    let buttonShadowLength: CGFloat = 2
    let shadowOpacity: Float = 0.8
    var VCImage: UIImage!
    var imageViewCanTap = true //推せるならtrue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageStyle(imageName: imageView)
        buttonStyle(buttonName: nextImageButton)
        buttonStyle(buttonName: backImageButton)
        buttonStyle(buttonName: saiseiOrTeishiButton)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewAnimation))
        imageView.addGestureRecognizer(tapGesture)
        gradient()

    }
    
   
    
    @IBAction func nextImageButtonAction(_ sender: Any) {
        ButtonTappedCount += 1
        imagesSlide()
        nextImageButtonAnimation()
    }
    
    
    @IBAction func backImageButtonAction(_ sender: Any) {
        ButtonTappedCount -= 1
        imagesSlide()
        backImageButtonAnimation()
    }
    
    @IBAction func slideshowTime(_ sender: Any) {
        saiseiOrTeishiButtonAnimation()
        if saiseiOrTeishiFlag == false {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshowAction), userInfo: nil, repeats: true)
            NextAndBackButtonStyle(buttonName: nextImageButton, isEnable: false, alpha: 0.6)
            NextAndBackButtonStyle(buttonName: backImageButton, isEnable: false, alpha: 0.6)
            saiseiOrTeishiButton.setTitle("停止", for: .normal)
            saiseiOrTeishiFlag = true
            imageViewCanTap = false
        }else if saiseiOrTeishiFlag == true {
            timer?.invalidate()
            NextAndBackButtonStyle(buttonName: nextImageButton, isEnable: true, alpha: 1)
            NextAndBackButtonStyle(buttonName: backImageButton, isEnable: true, alpha: 1)
            saiseiOrTeishiButton.setTitle("再生", for: .normal)
            saiseiOrTeishiFlag = false
            imageViewCanTap = true
        }
    }
    
    @objc func slideshowAction() {
        ButtonTappedCount += 1
        imagesSlide()
    }
    
    func imagesSlide() {
        switch ButtonTappedCount {
        case 0, 6, -6:
            imageView.image = UIImage(named: "tanjirou")
            ButtonTappedCount = 0
        case 1, -5:
            imageView.image = UIImage(named: "tomioka")
        case 2, -4:
            imageView.image = UIImage(named: "zenitu")
        case 3, -3:
            imageView.image = UIImage(named: "muzan")
        case 4, -2:
            imageView.image = UIImage(named: "rengoku")
        case 5, -1:
            imageView.image = UIImage(named: "teoni")
        default:
            print("error")
        }
    }
    
    func NextAndBackButtonStyle(buttonName button: UIButton, isEnable: Bool, alpha: CGFloat) {
        button.isEnabled = isEnable
        button.alpha = alpha
    }
    
    func buttonStyle(buttonName button: UIButton) {
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: buttonShadowLength, height: buttonShadowLength)
        button.layer.shadowOpacity = shadowOpacity
        button.layer.shadowRadius = 4
    }
    
    func imageStyle(imageName image: UIImageView) {
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.masksToBounds = false
        image.layer.shadowOffset = CGSize(width: buttonShadowLength * 2, height: buttonShadowLength * 2)
        image.layer.shadowOpacity = shadowOpacity
        image.layer.shadowRadius = 4
    }
    
    @objc func imageViewAnimation() {
        if imageViewCanTap == true {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
                self.imageView.layer.masksToBounds = true
                self.imageView.transform = CGAffineTransform(translationX: self.buttonShadowLength, y: self.buttonShadowLength)
            }) {_ in
                self.imageView.layer.masksToBounds = false
                self.imageView.transform = .identity
            }
            let largeImageVC = storyboard?.instantiateViewController(identifier: "LargeImageID") as! LargeImageViewController
            largeImageVC.ButtonTappedCount = ButtonTappedCount
            present(largeImageVC, animated: true)
        }
        
    }
    
    func nextImageButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
            self.nextImageButton.layer.shadowOpacity = 0
            self.nextImageButton.transform = CGAffineTransform(translationX: self.buttonShadowLength, y: self.buttonShadowLength)
        }) {_ in
            self.nextImageButton.layer.shadowOpacity = self.shadowOpacity
            self.nextImageButton.transform = .identity
        }
    }
    
    func backImageButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
            self.backImageButton.layer.shadowOpacity = 0
            self.backImageButton.transform = CGAffineTransform(translationX: self.buttonShadowLength, y: self.buttonShadowLength)
        }) {_ in
            self.backImageButton.layer.shadowOpacity = self.shadowOpacity
            self.backImageButton.transform = .identity
        }
    }
    
    func saiseiOrTeishiButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
            self.saiseiOrTeishiButton.layer.shadowOpacity = 0
            self.saiseiOrTeishiButton.transform = CGAffineTransform(translationX: self.buttonShadowLength, y: self.buttonShadowLength)
        }) {_ in
            self.saiseiOrTeishiButton.layer.shadowOpacity = self.shadowOpacity
            self.saiseiOrTeishiButton.transform = .identity
        }
    }
    
    func gradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        gradientLayer.colors = [UIColor(red: 0.8, green: 0.0, blue: 0.73, alpha: 1).cgColor,
                                UIColor(red: 0.1, green: 0.0, blue: 0.40, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0.5)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}

