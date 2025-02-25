//
//  SignUpController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 19/02/25.
//

import UIKit

class SignUpController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var termsAndServices: UILabel!
    @IBOutlet weak var loginInBlue: UILabel!
    @IBOutlet weak var btnGoogleLogin: UIButton!
    @IBOutlet weak var logoGoogle: UIImageView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var txtFieldFullName: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBAction func btnSignUpClick(_ sender: Any) {
        print("Sign Up button clicked from sign up page")
    }
    @IBAction func btnSignUpFacebook(_ sender: Any) {
        print("Sign up using Facebook Clicked")
    }
    @IBAction func btnSignUpGoogle(_ sender: Any) {
        print("Sign up using Google Clicked")
    }
    
    //     MARK: Lifecycle Events
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColors()
        setPropertiesSignup()
    }
    
    func changeColors() {
        if let termsAndServiceContent = termsAndServices.text {
            var attributedString = AttributedString(termsAndServiceContent)
            if let rangeOfTermsOfService = attributedString.range(of: "Terms of Service") {
                attributedString[rangeOfTermsOfService].foregroundColor = UIColor(named: "PracticeStrings")
            }
            if let rangeOfPrivacyPolicy = attributedString.range(of: "Privacy Policy") {
                attributedString[rangeOfPrivacyPolicy].foregroundColor = UIColor(named: "PracticeStrings")
            }
            termsAndServices.attributedText = NSAttributedString(attributedString)
        }
        
        if let loginBlueContent = loginInBlue.text {
            var attributedString = AttributedString(loginBlueContent)
            if let loginRange = attributedString.range(of: "Log in") {
                attributedString[loginRange].foregroundColor = UIColor(named: "PracticeStrings")
            }
            loginInBlue.attributedText = NSAttributedString(attributedString)
        }
    }
    
    func setPropertiesSignup() {
        btnSignUp.applyGradient()
        logoGoogle.layer.borderWidth = CGFloat(1)
        logoGoogle.layer.borderColor = CGColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.5)
        btnGoogleLogin.layer.borderWidth = CGFloat(1)
        btnGoogleLogin.layer.borderColor = CGColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.5)
        txtFieldFullName.setPadding(value: 10)
        txtFieldEmail.setPadding(value: 10)
        txtFieldPassword.setPadding(value: 10)
        txtFieldPassword.setSymbol(name: "eye.slash")
    }
    
}

//extension UITextField {
//    func setPadding(value: Int) {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: Int(self.frame.height)))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//        self.rightView = paddingView
//        self.rightViewMode = .always
//    }
//    
//    func setSymbol(name: String) {
//        let imgView = UIImageView(image: UIImage(systemName: name))
//        imgView.tintColor = UIColor(named: "LabelColor")
//        self.rightView = imgView
//        self.rightViewMode = .always
//    }
//}
