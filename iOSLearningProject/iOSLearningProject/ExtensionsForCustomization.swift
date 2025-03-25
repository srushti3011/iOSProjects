//
//  ExtensionsForCustomization.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 25/02/25.
//

import Foundation
import UIKit

extension UIButton {
    func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(named: "gradientStart")!.cgColor,
            UIColor(named: "gradientEnd")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func roundedBorder(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
    }
}

extension UITextField {
    func setPadding(value: Int) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: Int(self.frame.height)))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setSymbol(name: String) {
        let imgView = UIImageView(image: UIImage(systemName: name))
        imgView.tintColor = UIColor(named: "LabelColor")
        self.rightView = imgView
        self.rightViewMode = .always
    }
    
    func setBottomBorder() {
        self.layer.shadowColor = CGColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UILabel {
    func stringColorChange(of: String, toColor: UIColor) {
        guard let text = self.text else {return}
        var attributedString = AttributedString(text)
        guard let rangeOfString = attributedString.range(of: of) else {return}
        attributedString[rangeOfString].foregroundColor = toColor
        self.attributedText = NSAttributedString(attributedString)
    }
}
