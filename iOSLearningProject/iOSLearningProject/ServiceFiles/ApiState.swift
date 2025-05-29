//
//  ApiState.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 22/05/25.
//

import Foundation

enum ApiState<U> {
    case Loading, Error(error: Error), Success(data: U)
}

enum UIState<T> {
    case idle
    case loading
    case success(data: T)
    case error(error: Error)
}

enum APIError: LocalizedError {
    case serverMessage(String)

    var errorDescription: String? {
        switch self {
        case .serverMessage(let message):
            return "Can't Login: \(message)"
        }
    }
}
