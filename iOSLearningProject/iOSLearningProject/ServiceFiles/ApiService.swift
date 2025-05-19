//
//  DummyDataApiServiceOne.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/05/25.
//

import Foundation

enum ApiState {
    case Loading, Error, GotNonEmptyResponse, GotEmptyResponse
}

class ApiService {
    static var apiState = ApiState.Loading
    static let sharedaApiCallInstance = ApiService()
    
    static let configurationObject = URLSessionConfiguration.default
//    static let configurationObject = URLSessionConfiguration.init()
    static let customConfigSession = URLSession(configuration: ApiService.configurationObject)
    
    init() {
        ApiService.configurationObject.timeoutIntervalForRequest = 1000
        ApiService.configurationObject.allowsCellularAccess = false
    }
    
    func callAPI(urlToCall: URL, completionHandler: @escaping (ResponseFromAPI?, Error?, ApiState) -> Void) {
        print("Requesting")
        let task = ApiService.customConfigSession.dataTask(with: urlToCall) { (data, response, error) in
            if let error {
                print("Error", error.localizedDescription)
                // change state to error state i.e. the failed state
                ApiService.apiState = ApiState.Error
                completionHandler(nil, error, ApiService.apiState)
            } else {
                guard let response = response as? HTTPURLResponse, let data else { return }
                if response.statusCode == 200 {
                    if data.isEmpty {
                        // change state to empty state
                        print("Data is empty")
                        print(data.isEmpty)
                        ApiService.apiState = ApiState.GotEmptyResponse
                        completionHandler(nil, nil, ApiService.apiState)
                    } else {
                        // change state to data got state
                        do {
                            let decoder = JSONDecoder()
                            let parsedData = try decoder.decode(ResponseFromAPI.self, from: data)
                            ApiService.apiState = ApiState.GotNonEmptyResponse
                            print("Got data")
                            completionHandler(parsedData, nil, ApiService.apiState)
                        } catch {
                            print("Something went wrong")
                        }
                    }
                } else {
                    print("status code not 200")
                    print(response.statusCode)
                    ApiService.apiState = ApiState.Error
                    completionHandler(nil, nil, ApiService.apiState)
                }
            }
        }
        task.resume()
    }
    
    func getPosts(urlToCall: URL, completionHandler: @escaping ([ResponseFromAPI]?, Error?) -> Void) {
        let sharedSession = URLSession.shared
        let urlToCall = URLRequest(url: urlToCall)
        let dataTask = sharedSession.dataTask(with: urlToCall) { (jsonReceived, response, error) in
            guard let jsonReceived else {
                completionHandler(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let parsedData = try decoder.decode([ResponseFromAPI].self, from: jsonReceived)
                completionHandler(parsedData, nil)
            } catch {
                print("Something went wrong")
            }
        }
        dataTask.resume()
    }
    
    func postPost(urlToCall: URL) {
        var request = URLRequest(url: urlToCall)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let body = [
            "title": "titleOfPost",
            "body": "bodyOfPost"
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        let task = ApiService.customConfigSession.dataTask(with: request) { (jsonRes, response, error) in
            if let error {
                print(error.localizedDescription)
                return
            } else {
                guard let urlResponse = response as? HTTPURLResponse, let jsonRes else { return }
                print(urlResponse.statusCode)
                if urlResponse.statusCode == 201 {
                    print("OK")
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: jsonRes, options: [])
                        print(jsonResponse)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
        task.resume()
    }
    
    func updatePostUsingPutRequest(urlToCall: URL) {
        let updatedData: [String: Any] = [
                    "id": 1,
                    "title": "Updated Title",
                    "body": "This is an updated body for the PUT request.",
                    "userId": 1
                ]
        let request = configureRequest(callUrl: urlToCall, methodType: "PUT", bodyOfRequest: updatedData)
        let task = ApiService.customConfigSession.dataTask(with: request) { (jsonRes, response, error) in
            if let error {
                print(error.localizedDescription)
                return
            } else {
                guard let urlResponse = response as? HTTPURLResponse, let jsonRes else { return }
                print(urlResponse.statusCode)
                if urlResponse.statusCode == 200 {
                    print("OK")
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: jsonRes, options: [])
                        print(jsonResponse)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
        task.resume()
    }
    
    func deletePost(urlToCall: URL) {
        var request = URLRequest(url: urlToCall)
        request.httpMethod = "DELETE"
        let task = ApiService.customConfigSession.dataTask(with: request) { (jsonRes, response, error) in
            if let error {
                print(error.localizedDescription)
                return
            } else {
                guard let urlResponse = response as? HTTPURLResponse, let jsonRes else { return }
                print(urlResponse.statusCode)
                if urlResponse.statusCode == 200 {
                    print("OK")
                    do {
                        let serializedData = try JSONSerialization.jsonObject(with: jsonRes, options: [])
                        print(serializedData)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
        task.resume()
    }
    
    func getWithQueryParam(urlToCall: String, queryParam: URLQueryItem) {
        var urlComponent = URLComponents(string: urlToCall)
        urlComponent?.queryItems = [
            queryParam
        ]
        guard let url = urlComponent?.url else { return }
        let task = ApiService.customConfigSession.dataTask(with: url) { (data, response, error) in
            if let error {
                print(error.localizedDescription)
                return
            } else {
                guard let urlResponse = response as? HTTPURLResponse, let data else { return }
                print(urlResponse.statusCode)
                
                if urlResponse.statusCode == 200 {
                    print("OK")
                    do {
                        let serializedData = try JSONSerialization.jsonObject(with: data, options: [])
                        print(serializedData)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
        task.resume()
    }
    
    func getWithPathParam(urlToCall: String, pathParam: String) {
        let urlString = "\(urlToCall)\(pathParam)"
        print(urlString)
        let url = URL(string: urlString)
        if let url {
            let request = URLRequest(url: url)
            let task = ApiService.customConfigSession.dataTask(with: request) { (data, response, error) in
                if let error {
                    print("Error getting data \(error.localizedDescription)")
                }
                if let response {
                    print("Got response \(response)")
                }
                if let data {
                    do {
                        let responseJson = try JSONSerialization.jsonObject(with: data, options: [])
                        print(responseJson)
                    } catch let error {
                        print("Error in parsing data \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
    
    func configureRequest(callUrl: URL, methodType: String, bodyOfRequest: [String : Any]) -> URLRequest {
        var request = URLRequest(url: callUrl)
        request.httpMethod = methodType
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let body = bodyOfRequest
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        return request
    }
    
    // generic code ---------------------------------------------------------------------------------------------------------------------------
    let baseurl = "https://reqres.in/api"
    
    func makeCall<T: Codable>(
        modelType: T.Type,
        method: RequestMethodType,
        endPoint: EndPoint,
        queryParams: [URLQueryItem]?,
        pathParam: String?,
        headers: [(Headers, String)]?,
        body: Any?,
        completionHandler: @escaping (T?, String?) -> Void
    ) {
        let url = computeURL(endPoint: endPoint, pathParam: pathParam, queryParams: queryParams)
        if let url {
            let request = getRequest(url: url, method: method, headers: headers, body: body)
            let task = ApiService.customConfigSession.dataTask(with: request) { (data, response, error) in
                if let error {
                    print("Error getting data \(error.localizedDescription)")
                    completionHandler(nil, error.localizedDescription)
                }
                if let data {
                    do {
//                        let responseJson = try JSONSerialization.jsonObject(with: data, options: [])
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(decodedData, nil)
                    } catch let error {
                        print("Error in parsing data \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
    
    func getRequest(url: URL, method: RequestMethodType, headers: [(Headers, String)]?, body: Any?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let body {
            do {
                if let codableBody = body as? Codable {
                    do {
                        let bodyToSet = try JSONEncoder().encode(codableBody)
                        request.httpBody = bodyToSet
                    } catch let error {
                        print("Encoding problem \(error.localizedDescription)")
                    }
                } else {
                    request.httpBody = try JSONSerialization.data(withJSONObject: body)
                }
            } catch let error {
                print("Error in serializing the body \(error.localizedDescription)")
            }
        }
        if let headers {
            for (header, value) in headers {
                request.setValue(value, forHTTPHeaderField: header.rawValue)
            }
        }
        return request
    }
    
    func computeURL(endPoint: EndPoint, pathParam: String?, queryParams: [URLQueryItem]?) -> URL? {
        if let pathParam {
            let urlString = "\(baseurl)\(endPoint.rawValue)/\(pathParam)"
            print(urlString)
            if let queryParams {
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = queryParams
                return urlComponent?.url
            }
            return URL(string: urlString)
        }
        if let queryParams {
            let urlString = "\(baseurl)\(endPoint.rawValue)"
            var urlComponent = URLComponents(string: urlString)
            urlComponent?.queryItems = queryParams
            return urlComponent?.url
        }
        return URL(string: "\(baseurl)\(endPoint.rawValue)")
    }
}

enum RequestMethodType: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
}

enum EndPoint: String {
    case users = "/users"
    case register = "/register"
    case login = "/login"
    
//    var endPoint: String {
//        switch self {
//        case .users(let uderid):
//            <#code#>
//        case .register:
//            <#code#>
//        case .login:
//            <#code#>
//        }
//    }
    
//    var headers:
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
