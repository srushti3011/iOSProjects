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
    @IBAction func btnSegue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SegueUINavigationController", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBAction func btnTabBarNavigation(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBarNavigationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "TabBarNavigationVC") as! TabBarNavigationVC
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBAction func btnNavBarCustomization(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaivgationBarCustomizationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NavigationBarCustomizationViewController") as! NavigationBarCustomizationViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBAction func btnDataPassing(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DataPassStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "DataPassVC") as! DataPassVC
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

