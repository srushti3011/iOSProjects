//
//  AlamofireAPIService.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 20/05/25.
//

import Foundation
import Alamofire

class AlamofireAPIService {
    static let shared = AlamofireAPIService()
    var session: Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache.shared
        session = Session(configuration: configuration, interceptor: APIRequestInterceptor())
    }
    
    func getSingleUser(url: String) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.cachePolicy = .returnCacheDataElseLoad
            if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
                print("Got cached data and the cached response is")
                if let responseString = String(data: cachedResponse.data, encoding: .utf8) {
                        print("Cached Data (String):\n\(responseString)")
                    } else {
                        print("Failed to convert cached data to String")
                    }
                return
            } else {
                print("didn't find in cache")
            }
            
            session.request(
                request
            ).response { (response) in
                switch response.result {
                case .success(let resData):
                    guard let resData else {
                        return
                    }
                    do {
                        let json = try JSONSerialization.jsonObject(with: resData, options: [])
                        print(json)
                    } catch let error {
                        print("Error in parsing \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }
    
    func registerUser() {
        if let url = URL(string: "https://reqres.in/api/register") {
            session.request(
                url,
                method: .post,
                parameters: [
                    "email": "eve.holt@reqres.in",
                    "password": "pistol"
                ]
            ).response { (response) in
                switch response.result {
                case .success(let data):
                    guard let data else {
                        return
                    }
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print("Error encountered \(error.localizedDescription)")
                }
            }
        }
    }
    
    func getListOfUsers() {
        var urlComponent = URLComponents(string: "https://reqres.in/api/users")
        urlComponent?.queryItems = [
            URLQueryItem(name: "page", value: "2")
        ]
        if let url = urlComponent?.url {
            session.request(url).response { (response) in
                switch response.result {
                case .success(let resData):
                    guard let resData else {
                        return
                    }
                    do {
                        let json = try JSONSerialization.jsonObject(with: resData, options: [])
                        print(json)
                    } catch let error {
                        print("Error in parsing \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }
    
    func callEndpointWithBody<T: Codable, U: Codable>(endPoint: EndPoint, body: T?, stateHandler: @escaping (ApiState<U>) -> Void) -> DataRequest? {
        stateHandler(ApiState.Loading)
        guard let endPointURL = endPoint.endPointURL else {
            return nil
        }
        let request = session.request(
            endPointURL,
            method: endPoint.httpMethod.alamofireMethod,
            parameters: body
        )
        request.validate()
        request.responseDecodable(of: U.self) { response in
            switch response.result {
            case .success(let decodedResponse):
                print(decodedResponse)
                stateHandler(ApiState<U>.Success(data: decodedResponse))
            case .failure(let error):
                if let apiError = try? JSONDecoder().decode(APIErrorResponse.self, from: response.data!) {
                    
                    let customError = APIError.serverMessage(apiError.error)
                    print("Decoded API Error: \(apiError)")
                    stateHandler(ApiState.Error(error: customError))
                    return
                }
                stateHandler(ApiState.Error(error: error))
            }
        }
        return request
    }
    
    func callEndpointWithoutBody<U: Codable>(endPoint: EndPoint, stateHandler: @escaping (ApiState<U>) -> Void) -> DataRequest? {
        stateHandler(ApiState.Loading)
        guard let endPointURL = endPoint.endPointURL else {
            return nil
        }
        let request = session.request(
            endPointURL,
            method: endPoint.httpMethod.alamofireMethod
        )
        request.validate()
        request.responseDecodable(of: U.self) { response in
            switch response.result {
            case .success(let decodedResponse):
                stateHandler(ApiState<U>.Success(data: decodedResponse))
            case .failure(let error):
                stateHandler(ApiState.Error(error: error))
            }
        }
        return request
    }
}

