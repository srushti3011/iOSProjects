//
//  LandingController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 19/02/25.
//

import UIKit

class LandingController: UIViewController {
    @IBAction func signUpClick(_ sender: Any) {
        print("Sign Up Button Clicked")
    }
    @IBAction func logInClick(_ sender: Any) {
        print("Login Button Clicked")
    }
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderWidth = CGFloat(1)
        loginButton.layer.borderColor = CGColor(red: 0.3, green: 0.6, blue: 0.9, alpha: 1.0)
        btnSignUp.applyGradient()
    }
}

extension UIButton {
    func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 29.0/255, green: 170.0/255, blue: 233.0/255, alpha: 1.0).cgColor,
            UIColor(red: 49.0/255.0, green: 99.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
