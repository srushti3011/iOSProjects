//
//  AuthenticatedScreens.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//
import UIKit

class AuthenticatedScreens: Coordinator {
    
    // MARK: Instance variables
    var navigationController: UINavigationController
    var selectedItem: Item? = nil
    
    // MARK: init Block
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Instance Methods
    func start() {
        let homeVC = HomeVC.instantiate(from: .authenticatedApp)
        homeVC.coordinator = self
        let architectureHomeVC = ArchitectureHomeVC.instantiate(from: .main)
        navigationController.viewControllers = [architectureHomeVC, homeVC]
    }
    
    func goToDetail() {
        let detailVC = ItemDetailVC.instantiate(from: .authenticatedApp)
        detailVC.coordinator = self
        navigationController.pushViewController(detailVC, animated: true)
    }
}
