//
//  ResponseTypes.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 15/05/25.
//

import Alamofire

struct ResponseFromAPI: Codable {
    var userid: Int
    var id: Int
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case userid = "userId"
        case id
        case title
        case body
    }
}

struct UserCreated: Codable {
    init(name: String, job: String, id: String, createdAt: String) {
        self.name = name
        self.job = job
        self.id = id
        self.createdAt = createdAt
    }
    let name: String
    let job: String
    let id: String
    let createdAt: String
}

struct UserDetail: Codable {
    let data: DataForUser
    let support: Support
}

struct DataForUser: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email, firstName = "first_name", lastName = "last_name", avatar
    }
}

struct Support: Codable {
    let url: String
    let text: String
}

struct CreateUserBody: Codable {
    let name: String
    let job: String
}

struct CreatedUserResponse: Codable {
    let name: String
    let job: String
    let id: String
    let createdAt: String
}

struct UserList: Codable {
    let page, perPage, total, totalPages: Int
    let data: [DataForUser]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}
