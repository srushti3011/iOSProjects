//
//  NavControllerViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 10/03/25.
//

import UIKit

class NavControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btnGoToSegueNavController(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SegueUINavigationController", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
