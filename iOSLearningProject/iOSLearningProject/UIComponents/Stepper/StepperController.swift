//
//  StepperController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 27/02/25.
//

import UIKit

class StepperController: UIViewController {
    
//    MARK: -Outlets
    
    @IBOutlet weak var lblDisplayQuantity: UILabel!
    @IBOutlet weak var lblQuantity: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//    MARK: -ACTIONS
    
    @IBAction func acnChangeQuantity(_ sender: UIStepper) {
        if lblQuantity.value == lblQuantity.maximumValue+1 {
            print("Max value reached")
        }
        if lblQuantity.value == lblQuantity.minimumValue-1 {
            print("Minimum value reached")
        }
        lblDisplayQuantity.text = String(Int(lblQuantity.value))
    }
}
