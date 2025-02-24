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
}
