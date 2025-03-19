//
//  ViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 24/02/25.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var landingScreenButton: UIButton!
    @IBOutlet weak var signUpScreenButton: UIButton!
    @IBOutlet weak var loginScreenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateToLanding(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LandingController") as! LandingController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func navigateToSignUp(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func navigateToLogin(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnKtLogin(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "KtExercise", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "KtLoginController") as! KtLoginController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnKTSignup(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "KtExercise", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "KtSignUpController") as! KtSignUpController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBAction func btnKtTask(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "KtTask", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "KtTaskLogin") as! KtTaskLogin
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToUiComponents(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "UiComponentsViewController") as! UiComponentsViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToNavigationController(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "NavigationController", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NavControllerViewController") as! NavControllerViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToUserDefault(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "UserDefaultStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "UserDefaultVC") as! UserDefaultVC
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func goToNavAndUIKt(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "KtNavigationAndUiSB", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingVC
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
