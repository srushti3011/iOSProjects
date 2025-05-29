//
//  UserViewModel.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import Foundation
import Alamofire

class UserViewModel {
    var reloadTableData: (() -> ())?
    var showLoading: (() -> ())?
    var hideLoading: (() -> ())?
    var showError: (() -> ())?
    var data: [DataForUser] = [DataForUser]()
    var dataForTableView: [UserListData] = [UserListData]()
    
    func callAPI() -> DataRequest? {
        let request = AlamofireAPIService.shared.callEndpointWithoutBody(
            endPoint: EndPoint.getUserList(pageNo: 2)
        ) { (state: ApiState<UserList>) in
            switch state {
            case .Loading:
                self.showLoading?()
            case .Error(_):
                self.hideLoading?()
            case .Success(let response):
                self.hideLoading?()
                self.data = response.data
                self.setUserListUIModel()
                self.reloadTableData?()
            }
        }
        return request
    }
    
    func setUserListUIModel() {
        for user in self.data {
            let userItem = UserListData(user: user)
            self.dataForTableView.append(userItem)
        }
    }
}
