//
//  DataPassingUsingNavigationViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 11/03/25.
//

import UIKit

class DataPassingUsingNavigationViewController: UIViewController {
    
    @IBOutlet weak var txtFieldInfoInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnPassData(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DataPassingStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ReceiveDataVC") as! ReceiveDataVC
        nextViewController.delegate = self
        nextViewController.dataReceived = txtFieldInfoInput.text
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension DataPassingUsingNavigationViewController: PassDataToFirst {
    func setDataReceived(newData: String) {
        txtFieldInfoInput.text = newData
    }
}
