//
//  DataPassVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/03/25.
//

import UIKit

class DataPassVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnGoToNormalDataPassing(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DataPassingStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "DataPassingUsingNavigationViewController") as! DataPassingUsingNavigationViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToTableViewDataPassing(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TableViewDataPassingStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "TableViewPassData") as! TableViewPassData
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}
