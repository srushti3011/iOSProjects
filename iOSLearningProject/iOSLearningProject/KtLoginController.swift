//
//  KtLogin.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 20/02/25.
//

import Foundation
import UIKit

class KtLoginController: UIViewController {
    
    @IBOutlet weak var labelLoginHeading: UILabel!
    @IBOutlet weak var labelLoginSubheading: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var labelForgotPassword: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var labelNoAccount: UIView!
    
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var lblNoAcc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        assigning the values from string catalog
        labelLoginHeading.text = NSLocalizedString("loginHeading", comment: "")
        labelLoginSubheading.text = NSLocalizedString("loginSubHeading", comment: "")
        labelEmail.text = NSLocalizedString("emailLabel", comment: "")
        labelPassword.text = NSLocalizedString("passwordLabel", comment: "")
        labelForgotPassword.text = NSLocalizedString("forgotPassword", comment: "")
        lblNoAcc.text = NSLocalizedString("noAccountQn", comment: "")
        
//        setting other properties
        txtFieldEmail.setBottomBorder()
        txtFieldPassword.setBottomBorder()
        btnLogin.roundedBorder(radius: 19)
        lblNoAcc.stringColorChange(of: "Signup", toColor: UIColor(red: 76.0/255.0, green: 167.0/255.0, blue: 109.0/255.0, alpha: 1.0))
        lblNoAcc.font = UIFont(name: "Gilroy-SemiBold", size: 14.0)
        labelLoginHeading.font = UIFont(name: "Gilroy-SemiBold", size: 24.0)
        txtFieldPassword.setSymbol(name: "eye.slash")
    }
}

extension UITextField {
    func setBottomBorder() {
        self.layer.shadowColor = CGColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UIButton {
    func roundedBorder(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
    }
}

extension UILabel {
    func stringColorChange(of: String, toColor: UIColor) {
        guard let text = self.text else {return}
        var attributedString = AttributedString(text)
        guard let rangeOfString = attributedString.range(of: of) else {return}
        attributedString[rangeOfString].foregroundColor = toColor
        self.attributedText = NSAttributedString(attributedString)
    }
}
