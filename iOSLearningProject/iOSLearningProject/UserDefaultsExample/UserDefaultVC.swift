//
//  UserDefaultVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/03/25.
//

import UIKit

class UserDefaultVC: UIViewController {
    var userDefault = UserDefaults()

    @IBOutlet weak var lblDisplayContent: UILabel!
    @IBOutlet weak var txtFieldInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDisplayContent.text = userDefault.string(forKey: "name")
    }

    @IBAction func saveTextToUserDefault(_ sender: Any) {
        userDefault.setValue(txtFieldInput.text, forKey: "name")
    }
}
