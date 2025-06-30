//
//  CustomControlHomeVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 24/06/25.
//

import UIKit

class CustomControlHomeVC: UIViewController {
    
    // MARK: Instance variables
    let slider = Slider()
    
    // MARK: IBOutlets
    @IBOutlet weak var lblMaxValue: UILabel!
    @IBOutlet weak var lblMinValue: UILabel!
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
        view.addSubview(slider)
        let tap = UITapGestureRecognizer(target: self, action: #selector(CustomControlHomeVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20
        let width = view.bounds.width - 2 * margin
        let height: CGFloat = 30
        slider.frame = CGRect(x: 0, y: 0, width: width, height: height)
        slider.center = view.center
    }
    
    // MARK: objc Methods
    @objc func sliderChanged(_ sender: Slider) {
        lblMinValue.text = String(format: "%.0f", sender.minThumbCurrentValue)
        lblMaxValue.text = String(format: "%.0f", sender.maxThumbCurrentValue)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
