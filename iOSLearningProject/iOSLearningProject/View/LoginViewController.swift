//
//  LoginViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import UIKit
import Combine

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var viewMostParent: UIView!
    private var cancellables = Set<AnyCancellable>()
    @IBOutlet weak var lblApiState: UILabel!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    var email: String?
    var password: String?
    let viewModel = UserLoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblApiState.layer.isHidden = true
        [txtFieldEmail, txtFieldPassword].forEach{ $0.delegate = self }
        txtFieldEmail.keyboardType = .emailAddress
        
        viewModel.$userLoginUIState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .idle:
                    break
                case .loading:
                    self?.loginStateLoading()
                case .error(let error):
                    self?.loginStateError(error: error)
                case .success(let response):
                    self?.loginStateSuccess(response: response)
                }
            }
            .store(in: &cancellables)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        viewMostParent.addGestureRecognizer(tap)

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func txtFieldEmailValueChanged(_ sender: Any) {
        self.email = txtFieldEmail.text
    }
    
    @IBAction func txtFieldEmailEdited(_ sender: Any) {
        self.email = txtFieldEmail.text
    }
    
    @IBAction func txtFieldPasswordEdited(_ sender: Any) {
        self.password = txtFieldPassword.text
    }
    
    @IBAction func txtFieldPasswordValueChanged(_ sender: Any) {
        self.password = txtFieldPassword.text
    }
    
    @IBAction func btnCallApiForLogin(_ sender: Any) {
        viewModel.requestBody = UserLogin(email: self.email, password: self.password)
        [txtFieldEmail, txtFieldPassword].forEach{ $0.resignFirstResponder() }
        viewModel.callApi()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func loginStateLoading() {
        DispatchQueue.main.async {
            self.viewMostParent.showBlurLoader()
            self.lblApiState.layer.isHidden = false
            self.lblApiState.textColor = UIColor(named: "BlackColor")
            self.lblApiState.text = "Checking credentials"
        }
    }
    
    func loginStateError(error: Error) {
        DispatchQueue.main.async {
            self.viewMostParent.removeBluerLoader()
            self.lblApiState.layer.isHidden = false
            self.lblApiState.text = error.localizedDescription
            print(error.localizedDescription)
            self.lblApiState.textColor = UIColor(named: "LoginError")
        }
    }
    
    func loginStateSuccess(response: UserLoginResponse) {
        DispatchQueue.main.async {
            self.viewMostParent.removeBluerLoader()
            self.lblApiState.layer.isHidden = false
            self.lblApiState.text = "Login successful"
            self.lblApiState.textColor = UIColor(named: "LoginSuccessful")
        }
        UserDefaults.standard.set(response.token, forKey: "userToken")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "UserListAndCreationViewController") as! UserListAndCreationViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            self.navigationController?.removeViewController(LoginViewController.self)
        }
    }
    
    func idleState() {
        self.lblApiState.textColor = UIColor(named: "BlackColor")
        self.lblApiState.text = ""
    }
}

extension UINavigationController {
    func removeViewController(_ controller: UIViewController.Type) {
        if let viewController = viewControllers.first(where: { $0.isKind(of: controller.self) }) {
            viewController.removeFromParent()
        }
    }
}
