//
//  RequesBuildingInfo.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 22/05/25.
//

import Foundation
import Alamofire

enum RequestMethodType: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    
    var alamofireMethod: HTTPMethod {
        switch self {
        case .GET:
            .get
        case .POST:
            .post
        case .PUT:
            .put
        case .PATCH:
            .patch
        case .DELETE:
            .delete
        }
    }
}

enum EndPoint {
    case getUserList(pageNo: Int)
    case getSingleUser(userId: Int)
    case createUser
    case updateWholeUser(userId: Int)
    case updateUser(userId: Int)
    case deleteUser(userId: Int)
    case registerUser
    case loginUser
    
    var baseURL: String {
        switch self {
        default:
            "https://reqres.in/api"
        }
    }
    
    var httpMethod: RequestMethodType {
        switch self {
        case .getUserList:
            .GET
        case .getSingleUser:
            .GET
        case .createUser:
            .POST
        case .updateWholeUser:
            .PUT
        case .updateUser(_):
            .PATCH
        case .deleteUser(_):
            .DELETE
        case .registerUser:
            .POST
        case .loginUser:
            .POST
        }
    }
    
    var endPointURL: URL? {
        switch self {
        default:
            var urlComponent = URLComponents(string: "\(self.baseURL)\(self.endPointRoute)\(self.pathParam ?? "")")
            urlComponent?.queryItems = self.queryParamters
            return urlComponent?.url
        }
    }
    
    var endPointRoute: String {
        switch self {
        case .getUserList, .getSingleUser, .createUser, .updateWholeUser, .updateUser, .deleteUser:
            return "/users"
        case .registerUser:
            return "/register"
        case .loginUser:
            return "/login"
        }
    }
    
    var pathParam: String? {
        switch self {
        case .getSingleUser(let userId), .updateWholeUser(let userId), .updateUser(let userId), .deleteUser(let userId):
            return "/\(String(userId))"
        default:
            return nil
        }
    }
    
    var queryParamters: [URLQueryItem]? {
        switch self {
        case .getUserList(let pageNo):
            print("\(String(pageNo))")
            return [URLQueryItem(name: "page", value: "\(String(pageNo))")]
        default:
            return nil
        }
    }
    
    var headers: [(String, String)] {
        switch self {
        default:
            [
                (Headers.ContentType.rawValue, ContentType.json.rawValue),
                (Headers.Authorization.rawValue, "reqres-free-v1")
            ]
        }
    }
    
    var headersAlamofire: [(String, String)] {
        switch self {
        default:
            [
                (Headers.Authorization.rawValue, "reqres-free-v1")
            ]
        }
    }
}

enum Headers: String {
    case ContentType = "Content-Type"
    case Authorization = "x-api-key"
}

enum ContentType: String {
    case textHTML = "text/html"
    case json = "Application/json"
}

class User: Codable {
    init(name: String, job: String) {
        self.name = name
        self.job = job
    }
    let name: String
    let job: String
}
