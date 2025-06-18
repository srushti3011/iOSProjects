//
//  Coordinator.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController {get set}
    func start()
}
