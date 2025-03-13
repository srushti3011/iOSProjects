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
        transitioningDelegate = self

    }
    @IBAction func btnGoToSegueNavController(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SegueUINavigationController", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        navigationController?.pushViewController(nextViewController, animated: true)
//        nextViewController.transitioningDelegate = self
//        present(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToDataPassingPractice(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "DataPassStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "DataPassVC") as! DataPassVC
//        nextViewController.transitioningDelegate = self // Set transitioning delegate here
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToCustomizedNavigationBar(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "NaivgationBarCustomizationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NavigationBarCustomizationViewController") as! NavigationBarCustomizationViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToTabBarNavigation(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "TabBarNavigationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "TabBarNavigationVC") as! TabBarNavigationVC
        navigationController?.pushViewController(nextViewController, animated: true)
//        print(navigationController?.viewControllers)
    }
}

extension NavControllerViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) ->  UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.5, animationType: .present)
    }
}
