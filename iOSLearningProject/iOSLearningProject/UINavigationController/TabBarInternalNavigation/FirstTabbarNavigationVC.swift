//
//  TabbarNavigationViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 11/03/25.
//

import UIKit

class FirstTabbarNavigationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func goToFirstTabSecondVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBarNavigationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "FirstTabSecondVC") as! FirstTabSecondVC
//        let parentNav = self.navigationController?.parent as? UINavigationController
//        print(parentNav)
        navigationController?.pushViewController(nextViewController, animated: true)
        print(self.navigationController?.viewControllers)
//        if let targetViewController =
//            self.navigationController?.viewControllers.first(where: { $0 is NavControllerViewController }) {
//            self.navigationController?.popToViewController(targetViewController, animated: true)
//        }
//        let storyboard = UIStoryboard(name: "TabBarNavigationStoryboard", bundle: nil)
//        let nextViewController = storyboard.instantiateViewController(withIdentifier: "FirstTabSecondVC") as! FirstTabSecondVC
//        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
