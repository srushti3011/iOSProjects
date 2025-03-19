//
//  PaddedLabel.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/03/25.
//

import UIKit

@IBDesignable class PaddedLabel: UILabel {
        @IBInspectable var topInset: CGFloat = 4.0
        @IBInspectable var bottomInset: CGFloat = 4.0
        @IBInspectable var leftInset: CGFloat = 4.0
        @IBInspectable var rightInset: CGFloat = 4.0
        
        override func drawText(in rect: CGRect) {
            let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
            super.drawText(in: rect.inset(by: insets))
        }
        
        override var intrinsicContentSize: CGSize {
            let size = super.intrinsicContentSize
            return CGSize(width: size.width + leftInset + rightInset,
                          height: size.height + topInset + bottomInset)
        }
}
