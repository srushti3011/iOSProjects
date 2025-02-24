//
//  KtSignUpController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 20/02/25.
//

import Foundation
import UIKit

class KtSignUpController: UIViewController {
    
    
    @IBOutlet weak var labelSignup: UILabel!
    @IBOutlet weak var labelSignupSubheading: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var txtFieldUsername: UITextField!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var labelSignUp: UILabel!
    @IBOutlet weak var lblTermsServiceAndPrivacyPolicy: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        assigning the values from string catalog
        labelSignup.text = NSLocalizedString("signupHeading", comment: "")
        labelSignupSubheading.text = NSLocalizedString("signupSubHeading", comment: "")
        labelUsername.text = NSLocalizedString("usernameLabel", comment: "")
        labelEmail.text = NSLocalizedString("emailLabel", comment: "")
        labelPassword.text = NSLocalizedString("passwordLabel", comment: "")
        lblTermsServiceAndPrivacyPolicy.text = NSLocalizedString("termsOfService", comment: "")
        labelSignUp.text = NSLocalizedString("haveAccountQn", comment: "")
        
        btnSignUp.roundedBorder(radius: 19)
        lblTermsServiceAndPrivacyPolicy.stringColorChange(of: "Privacy Policy", toColor: UIColor(red: 76.0/255.0, green: 167.0/255.0, blue: 109.0/255.0, alpha: 1.0))
        lblTermsServiceAndPrivacyPolicy.stringColorChange(of: "Terms of Service", toColor: UIColor(red: 76.0/255.0, green: 167.0/255.0, blue: 109.0/255.0, alpha: 1.0))
        labelSignUp.stringColorChange(of: "Sign up", toColor: UIColor(red: 76.0/255.0, green: 167.0/255.0, blue: 109.0/255.0, alpha: 1.0))
        txtFieldUsername.setBottomBorder()
        txtFieldEmail.setBottomBorder()
        txtFieldPassword.setBottomBorder()
        txtFieldPassword.setSymbol(name: "eye.slash")
    }
}
