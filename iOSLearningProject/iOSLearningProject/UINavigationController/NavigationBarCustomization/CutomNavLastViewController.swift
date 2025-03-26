//
//  CutomNavLastViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 11/03/25.
//

import UIKit

class CutomNavLastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnGoToHome(_ sender: Any) {
        // Pop back to a specific view controller
//        if let targetViewController = self.navigationController?.viewControllers.first(where: { $0 is NavigationBarCustomizationViewController }) {
//            self.navigationController?.popToViewController(targetViewController, animated: true)
//        }
        print(self.navigationController?.viewControllers)
        navigationController?.popToRootViewController(animated: true)
    }
}
