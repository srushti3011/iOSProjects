//
//  Storyboarded.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//
import UIKit

enum Storyboard: String {
    case main = "Main"
    case authentication = "Authentication"
    case authenticatedApp = "AuthenticatedAppScreens"
}

protocol Storyboarded: AnyObject {
    static func instantiate(from storyboard: Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboard: Storyboard) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
