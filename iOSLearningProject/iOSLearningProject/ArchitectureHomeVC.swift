//
//  ArchitectureHomeVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 18/06/25.
//

import UIKit

class ArchitectureHomeVC: UIViewController, Storyboarded {

    var authenticationCoordinator: AuthenticationCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnGoToMVCAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MVCStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(identifier: "MVCHomeVC") as? MVCHomeVC
        if let nextViewController {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @IBAction func btnGoToMVPAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Product", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(identifier: "ProductViewController") as? ProductViewController
        if let nextViewController {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @IBAction func btnGoToMVVMAction(_ sender: Any) {
        authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController!)
        authenticationCoordinator?.start()
    }
    
    
    @IBAction func btnGoToViperAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "ViperStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViperHomeVC") as? ViperHomeVC
        if let nextViewController {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
