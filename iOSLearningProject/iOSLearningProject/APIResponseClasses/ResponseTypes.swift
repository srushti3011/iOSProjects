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
//Imp:
//Loading state
//Failure state
//Success state
//    Data got state
//    Empty state
//Cancel state
