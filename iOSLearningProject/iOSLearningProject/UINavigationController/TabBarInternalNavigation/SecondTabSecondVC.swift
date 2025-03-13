//
//  SecondTabSecondVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/03/25.
//

import UIKit

class SecondTabSecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(navigationController?.viewControllers)
    }
    @IBAction func btnGoToSecondTabThirdScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBarNavigationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "SecondTabThirdVC") as! SecondTabThirdVC
        navigationController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
