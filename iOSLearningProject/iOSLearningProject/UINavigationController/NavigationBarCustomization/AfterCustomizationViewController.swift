//
//  AfterCustomizationViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 11/03/25.
//

import UIKit

class AfterCustomizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.backward.fill"), style: .plain, target: self, action: #selector(tappedBackButton))
    }
    
    @IBAction func btnGoToNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaivgationBarCustomizationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "CutomNavLastViewController") as! CutomNavLastViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func tappedBackButton() {
        print("button tapped")
        navigationController?.popViewController(animated: true)
    }
}
