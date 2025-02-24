//
//  LoginController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 19/02/25.
//

import UIKit

final class LoginController: UIViewController {
    @IBOutlet weak var signUpBlue: UILabel!
    @IBOutlet weak var googleLogo: UIImageView!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
//    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBAction func btnLoginClick(_ sender: Any) {
        print("Login button clicked from login page")
    }
    
    @IBAction func btnLoginFacebook(_ sender: Any) {
        print("Login using Facebook clicked")
    }
    
    @IBAction func btnLoginGoogle(_ sender: Any) {
        print("Login using Google clicked")
    }
    
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let signUpBlueText = signUpBlue.text {
            var attributedString = AttributedString(signUpBlueText)
            if let rangeOfSignUp = attributedString.range(of: "Sign Up") {
                attributedString[rangeOfSignUp].foregroundColor = UIColor(red: 37.0/255, green: 130.0/255, blue: 223.0/255, alpha: 1.0)
                
            }
            signUpBlue.attributedText = NSAttributedString(attributedString)
        }
        googleLogo.layer.borderWidth = CGFloat(1)
        googleLogo.layer.borderColor = CGColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.5)
        googleLoginButton.layer.borderWidth = CGFloat(1)
        googleLoginButton.layer.borderColor = CGColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.5)
        btnLogin.applyGradient()
        txtFieldEmail.setPadding(value: 10)
        txtFieldPassword.setPadding(value: 10)
        txtFieldPassword.setSymbol(name: "eye.slash")
    }
}
