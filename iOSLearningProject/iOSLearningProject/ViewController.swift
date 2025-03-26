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


    @IBAction func btnGoToUserDefaultsPractice(_ sender: Any) {
        let storyboard = UIStoryboard(name: "UserDefaultStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "UserDefaultVC") as! UserDefaultVC
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

