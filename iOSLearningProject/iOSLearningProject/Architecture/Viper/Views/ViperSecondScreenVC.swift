//
//  ViperSecondScreenVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 17/06/25.
//

import UIKit

class ViperSecondScreenVC: UIViewController {

    // MARK: Instance variables
    var message: String?
    
    // MARK: IBOutlets
    @IBOutlet weak var lblMessage: UILabel!
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = message
    }
}
