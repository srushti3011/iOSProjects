//
//  ApiState.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 22/05/25.
//

import Foundation

enum ApiState {
    case Loading, Error(message: String), Success, Cancelled
}
