//
//  OnboardingVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/03/25.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var btnGetStarted: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("onboarding viewdidload")
        setupUI()
    }
    
    func setupUI() {
        btnGetStarted.layer.cornerRadius = 16
    }
    
    @IBAction func btnGetStartedAction(_ sender: Any) {
        if let navigationController = self.navigationController {
            let storyboard = UIStoryboard(name: "KtNavigationAndUiSB", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "CoffeeHomeTabBarVC") as! CoffeeHomeTabBarVC
            navigationController.setViewControllers([nextViewController], animated: true)
        }
    }
}
