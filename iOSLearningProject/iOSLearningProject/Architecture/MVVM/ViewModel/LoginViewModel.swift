//
//  LoginViewModel.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//

class LoginViewModel {
    
    //MARK: Instance methods
    func validateInput(email: String, password: String) -> Bool {
        if email.isEmpty {
            print("Email is empty")
            return false
        } else if password.isEmpty {
            print("Password is empty")
            return false
        } else {
            return callLoginApi(email: email, password: password)
        }
    }
    
    func callLoginApi(email: String, password: String) -> Bool {
        // call alamofire or urlsession
        if email == "sample@gmail.com" && password == "sample@123" {
            print("Logged in successfully")
            UserHelper.shared.isLoggedIn = true
            return true
        } else {
            print("Error in logging in")
            return false
        }
    }
}
