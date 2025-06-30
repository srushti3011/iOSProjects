//
//  ViperRouter.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 17/06/25.
//
import UIKit

class ViperRouter: PresenterToRouter {
    
    var navigationController: UINavigationController? = nil
    
    func navigateToNext(message: String) {
        let storyboard = UIStoryboard(name: "ViperStoryboard", bundle: nil)
        let nextViewcontroller = storyboard.instantiateViewController(withIdentifier: "ViperSecondScreenVC") as! ViperSecondScreenVC
        if let navController = self.navigationController {
            navController.pushViewController(nextViewcontroller, animated: true)
            nextViewcontroller.message = message
        }
    }
}
