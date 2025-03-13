//
//  SecondTabbarNavigationVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 11/03/25.
//

import UIKit

class SecondTabbarNavigationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnGoToSecondScreenSecondTab(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBarNavigationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "SecondTabSecondVC") as! SecondTabSecondVC
//        navigationController?.pushViewController(nextViewController, animated: true)
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
