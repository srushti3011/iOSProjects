//
//  File.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 26/02/25.
//

import Foundation
import UIKit

class LblTxtFld: UIViewController {
    
//    MARK: IBOutlets
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var lblDisplayInputName: UILabel!
    @IBOutlet weak var txtVwAddress: UITextView!
    @IBOutlet weak var lblDisplayInputAddress: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    @IBOutlet weak var lblDisplayAge: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var switchComponent: UISwitch!
    @IBOutlet weak var lblDisplaySwitchState: UILabel!
    
    //    MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfldName.placeholder = "Enter name here"
        lblDisplayInputName.backgroundColor = UIColor.gray
        lblDisplayInputName.text = ""
        txtVwAddress.addAccessoryView()
    }
    
//    MARK: IBActions
    @IBAction func acnGetNameInput(_ sender: Any) {
        let nameInput = txtfldName.text
        lblDisplayInputName.text = nameInput
    }
    
    @IBAction func acnAgeValueChange(_ sender: Any) {
        let age = sliderAge.value
        lblDisplayAge.text = "\(Int(age))"
    }
    
    @IBAction func acnIncreaseProgress(_ sender: Any) {
        if progressBar.progress == 1.0 {
            progressBar.setProgress(0.0, animated: true)
        } else {
            progressBar.setProgress(progressBar.progress + 0.1, animated: true)
        }
        
        if pageController.currentPage == pageController.numberOfPages - 1 {
            pageController.currentPage = 0
        } else {
            pageController.currentPage = pageController.currentPage + 1
        }
    }
    
    @IBAction func acnSwitchValueChanged(_ sender: Any) {
        if switchComponent.isOn {
            lblDisplaySwitchState.text = "Switch is on"
            
        } else {
            lblDisplaySwitchState.text = "Switch is off"
            switchComponent.tintColor = UIColor.brown
        }
    }
    
}

extension LblTxtFld: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtfldName {
            textField.resignFirstResponder()
        }
        return true
    }
}

