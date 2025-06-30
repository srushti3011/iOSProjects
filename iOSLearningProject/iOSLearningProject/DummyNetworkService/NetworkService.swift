//
//  NetworkServic.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/06/25.
//

class NetworkService {
    
    static let shared = NetworkService()
    
    func addNumers(numOne: Int, numTwo: Int) -> Int {
        return numOne + numTwo
    }
}
