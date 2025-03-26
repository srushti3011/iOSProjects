//
//  MySegue.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 10/03/25.
//

import UIKit

class MySegue: UIStoryboardSegue {
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    override func perform() {
        if let firstVCView = self.source.view, let secondVCView = self.destination.view
        {
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            secondVCView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
            let window = UIApplication.shared.keyWindow
            window?.insertSubview(secondVCView, aboveSubview: firstVCView)
            
            UIView.animate(withDuration: 0.4) {
                firstVCView.frame = firstVCView.frame.offsetBy(dx: 0, dy: -screenHeight)
                secondVCView.frame = secondVCView.frame.offsetBy(dx: 0, dy: -screenHeight)
            } completion: { finish in
                self.source.present(self.destination, animated: false, completion: nil)
            }
        }
    }
}
