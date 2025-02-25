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
        
        assignStringsToLabelsKTLogin()
        setPropertiesKTLogin()
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
            let location = sender.location(in: lblNoAcc)
            let text = lblNoAcc.attributedText!.string
            let clickableRange = (text as NSString).range(of: "Signup")
            let layoutManager = NSLayoutManager()
            let textContainer = NSTextContainer(size: lblNoAcc.bounds.size)
            let textStorage = NSTextStorage(attributedString: lblNoAcc.attributedText!)
            layoutManager.addTextContainer(textContainer)
            textStorage.addLayoutManager(layoutManager)
            let index = layoutManager.glyphIndex(for: location, in: textContainer)
            if NSLocationInRange(index, clickableRange) {
                print("Signup text tapped!")
            }
        }
    
    func assignStringsToLabelsKTLogin() {
        labelLoginHeading.text = NSLocalizedString("loginHeading", comment: "")
        labelLoginSubheading.text = NSLocalizedString("loginSubHeading", comment: "")
        labelEmail.text = NSLocalizedString("emailLabel", comment: "")
        labelPassword.text = NSLocalizedString("passwordLabel", comment: "")
        labelForgotPassword.text = NSLocalizedString("forgotPassword", comment: "")
        lblNoAcc.text = NSLocalizedString("noAccountQn", comment: "")
    }
    
    func setPropertiesKTLogin() {
        txtFieldEmail.setBottomBorder()
        txtFieldPassword.setBottomBorder()
        btnLogin.roundedBorder(radius: 19)
        lblNoAcc.stringColorChange(of: "Signup", toColor: UIColor(named: "KTPracticeStrings")!)
        lblNoAcc.font = UIFont(name: "Gilroy-SemiBold", size: 14.0)
        labelLoginHeading.font = UIFont(name: "Gilroy-SemiBold", size: 24.0)
        txtFieldPassword.setSymbol(name: "eye.slash")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        lblNoAcc.isUserInteractionEnabled = true
        lblNoAcc.addGestureRecognizer(tapGesture)
    }
}

