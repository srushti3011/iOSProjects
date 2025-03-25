//
//  SecondViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 10/03/25.
//

import UIKit

class SecondViewController: UIViewController {

    var contentPassed: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Content passed from first")
        print(contentPassed)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let titleLabel = UILabel()
        titleLabel.text = "Custom Title"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
//        navigationItem.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func btnGoBackToFirst(_ sender: UIButton) {
        if let previousVc = self.presentingViewController as? FirstViewController {
            print(previousVc)
            previousVc.contentFromSecond = "Passing content while moving back"
            print("sent to first vc")
//           self.navigationController?.popViewController(animated: true)
        }
//        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
        
    }
}
