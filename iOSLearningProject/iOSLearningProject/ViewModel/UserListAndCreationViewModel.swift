//
//  UserListAndCreationViewModel.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import Foundation
import Alamofire

class UserListAndCreationViewModel {
    var data: [DataForUser] = [DataForUser]()
    var dataForTableView: [UserListData] = [UserListData]()
    @Published private(set) var userListUIState: UIState<[UserListData]> = .idle
    @Published private(set) var userCreationUIState: UIState<CreatedUserResponse> = .idle
    var changeProgress: ((Float) -> ())?
    
    func fetchListOfUsers() -> DataRequest? {
        let request = AlamofireAPIService.shared.callEndpointWithoutBody(
            endPoint: EndPoint.getUserList(pageNo: 1)
        ) { (state: ApiState<UserList>) in
            switch state {
            case .Loading:
                self.userListUIState = .loading
            case .Error(let error):
                self.userListUIState = .error(error: error)
            case .Success(let response):
                self.data = response.data
                self.setUserListUIModel()
                self.userListUIState = .success(data: self.dataForTableView)
            }
        }
        return request
    }
    
    func createUser() {
        _ = AlamofireAPIService.shared.callEndpointWithBody(
            endPoint: EndPoint.createUser,
            body: CreateUserBody(name: "MYName", job: "MYJob")
        ) { (state: ApiState<CreatedUserResponse>) in
            switch state {
            case .Loading:
                self.userCreationUIState = .loading
                self.userCreationUIState = .loading
            case .Error(let error):
                self.userCreationUIState = .error(error: error)
            case .Success(let response):
                self.userCreationUIState = .success(data: response)
            }
        }
    }
    
    func setUserListUIModel() {
        self.data.forEach{
            let userItem = UserListData(user: $0)
            self.dataForTableView.append(userItem)
        }
    }
}
