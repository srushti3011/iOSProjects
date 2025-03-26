//
//  ReceiveDataVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/03/25.
//

import UIKit

protocol PassDataToFirst {
    func setDataReceived(newData: String)
}

class ReceiveDataVC: UIViewController {

    var dataReceived: String?
    var delegate: PassDataToFirst?
    
    @IBOutlet weak var txtFieldInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setReceivedData()
    }
    
    func setReceivedData() {
        txtFieldInput.text = dataReceived ?? ""
    }
    
    @IBAction func btnGoBackAndSendData(_ sender: Any) {
        delegate?.setDataReceived(newData: txtFieldInput.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
