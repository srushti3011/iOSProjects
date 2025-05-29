//
//  UserDetailViewModel.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 26/05/25.
//

import Foundation

class UserDetailViewModel {
    
    var data: DataForUser? = nil
    @Published private(set) var userDetailUIState: UIState<DataForUser> = .idle
    var showUserData: ((DataForUser) -> ())?
    func getUserDetail(id: Int) {
        let _ = AlamofireAPIService.shared.callEndpointWithoutBody(
            endPoint: EndPoint.getSingleUser(userId: id)) { [self]
                (state: ApiState<UserDetail>) in
                switch state {
                case .Loading:
                    userDetailUIState = .loading
                    print("Loading")
                case .Error(let error):
                    userDetailUIState = .error(error: error)
                    print(error.localizedDescription)
                case .Success(let response):
                    self.data = response.data
                    if let data = self.data {
                        userDetailUIState = .success(data: data)
                    }
                }
            }
    }
}
