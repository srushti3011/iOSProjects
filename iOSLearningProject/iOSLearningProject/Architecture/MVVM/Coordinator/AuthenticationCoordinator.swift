//
//  AuthenticationCoordinator.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//
import UIKit

class AuthenticationCoordinator: Coordinator {
    
    // MARK: Instance variables
    var navigationController: UINavigationController
    
    // MARK: init block
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Instance methods
    func start() {
        if UserHelper.shared.isLoggedIn {
            showHome()
        } else {
            showLogin()
        }
    }
    
    func showHome() {
        let authScreenFlow = AuthenticatedScreens(navigationController: self.navigationController)
        authScreenFlow.start()
    }
    
    func showLogin() {
        let loginVC = LoginVC.instantiate(from: .authentication)
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
}
