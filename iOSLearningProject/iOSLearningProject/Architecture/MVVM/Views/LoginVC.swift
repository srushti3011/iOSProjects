//
//  LoginVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//

import UIKit

class LoginVC: UIViewController, Storyboarded {

    // MARK: Instance variables
    var coordinator: AuthenticationCoordinator?
    var viewModel: LoginViewModel?
    
    // MARK: IBOutlets
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
    }
    
    // MARK: IBActions
    @IBAction func btnLoginAction(_ sender: Any) {
        if let viewModel {
            if viewModel.validateInput(email: txtFieldEmail.text ?? "", password: txtFieldPassword.text ?? "") {
                coordinator?.showHome()
            }
        }
    }
}
