//
//  UserLoginViewModel.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import Foundation
import UIKit

class UserLoginViewModel {
    var requestBody: UserLogin?
    @Published private(set) var userLoginUIState: UIState<UserLoginResponse> = .idle
    
    func callApi() {
        guard let requestBody else {return}
        _ = AlamofireAPIService.shared.callEndpointWithBody(endPoint: EndPoint.loginUser, body: requestBody) {
            (state: ApiState<UserLoginResponse>) in
            switch state {
            case .Loading:
                self.userLoginUIState = .loading
            case .Error(let error):
                self.userLoginUIState = .error(error: error)
            case .Success(let response):
                self.userLoginUIState = .success(data: response)
            }
        }
    }
}
