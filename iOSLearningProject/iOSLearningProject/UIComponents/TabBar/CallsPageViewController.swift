//
//  CallsPageViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 06/03/25.
//

import UIKit

class CallsPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func acnLogsButton(_ sender: Any) {
        print("Logs button clicked")
    }
    @IBAction func acnKeypadButton(_ sender: Any) {
        print("Keypad button clicked")
    }
}

extension CallsPageViewController: UISearchBarDelegate {
    
}
