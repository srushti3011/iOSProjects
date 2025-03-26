//
//  ViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 24/02/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGoToKTSignup(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "KtExercise", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "KtSignUpController") as! KtSignUpController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToKYLogin(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "KtExercise", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "KtLoginController") as! KtLoginController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

