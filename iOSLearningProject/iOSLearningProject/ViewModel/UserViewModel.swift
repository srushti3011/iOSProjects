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
    
    func callAPI() -> DataRequest? {
        let request = AlamofireAPIService.shared.callEndpointWithoutBody(
            endPoint: EndPoint.getUserList(pageNo: 2)
        ) { (response: UserList?, state, error) in
            switch state {
            case .Loading:
                self.showLoading?()
            case .Error(_):
                self.hideLoading?()
            case .Success:
                if let response {
                    self.hideLoading?()
                    self.data = response.data
                    self.reloadTableData?()
                }
            case .Cancelled:
                print("Cancelled")
            }
        }
        return request
    }
}
