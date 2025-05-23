//
//  DummyDataApiServiceOne.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/05/25.
//

import Foundation
import Alamofire

class ApiService {
    static var apiState = ApiState.Loading
    static let sharedaApiCallInstance = ApiService()
    static let configurationObject = URLSessionConfiguration.default
    static let customConfigSession = URLSession(configuration: ApiService.configurationObject)
    
    init() {
        ApiService.configurationObject.timeoutIntervalForRequest = 1000
        ApiService.configurationObject.allowsCellularAccess = false
        //        ApiService.configurationObject.urlCache = URLCache.shared
    }
    
    func callAPI(urlToCall: URL, completionHandler: @escaping (ResponseFromAPI?, Error?, ApiState) -> Void) {
        print("Requesting")
        let task = ApiService.customConfigSession.dataTask(with: urlToCall) { (data, response, error) in
            if let error {
                print("Error", error.localizedDescription)
                ApiService.apiState = ApiState.Error(message: "Error")
                completionHandler(nil, error, ApiService.apiState)
            } else {
                guard let response = response as? HTTPURLResponse, let data else { return }
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let parsedData = try decoder.decode(ResponseFromAPI.self, from: data)
                        ApiService.apiState = ApiState.Success
                        print("Got data")
                        completionHandler(parsedData, nil, ApiService.apiState)
                    } catch {
                        print("Something went wrong")
                    }
                }
            }
        }
        task.resume()
    }
    
    func getPosts(urlToCall: URL, completionHandler: @escaping ([ResponseFromAPI]?, Error?) -> Void) {
        let sharedSession = URLSession.shared
        var request = URLRequest(url: urlToCall)
        request.cachePolicy = .returnCacheDataElseLoad
        
        let memoryCapacity = 4 * 1024 * 1024
        let diskCapacity = 100 * 1024 * 1024
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "myCache")
        URLCache.shared = urlCache
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            print("Got cached data")
            print(cachedResponse)
        } else {
            print("didn't find in cache")
        }
        
        let dataTask = sharedSession.dataTask(with: request) { (jsonReceived, response, error) in
            guard let jsonReceived else {
                completionHandler(nil, error)
                return
            }
            do {
                let cachedResponse = CachedURLResponse(response: response!, data: jsonReceived)
                URLCache.shared.storeCachedResponse(cachedResponse, for: request)
                let decoder = JSONDecoder()
                let parsedData = try decoder.decode([ResponseFromAPI].self, from: jsonReceived)
                completionHandler(parsedData, nil)
            } catch {
                print("Something went wrong")
            }
        }
        dataTask.resume()
    }
    
    func getPost(urlToCall: URL, completionHandler: @escaping (ResponseFromAPI?, Error?) -> Void) {
        //        URLCache.shared.removeAllCachedResponses()
        //        return
        let sharedSession = URLSession.shared
        var request = URLRequest(url: urlToCall)
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
        
        let dataTask = sharedSession.dataTask(with: request) { (jsonReceived, response, error) in
            guard let jsonReceived else {
                completionHandler(nil, error)
                return
            }
            do {
                //                print(response)
                let decoder = JSONDecoder()
                let parsedData = try decoder.decode(ResponseFromAPI.self, from: jsonReceived)
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
  
    func makeCallWithBody<T: Codable, U: Codable>(
        endPoint: EndPoint,
        body: T? = nil,
        stateHandler: @escaping(U?, ApiState, String?) -> Void
    ) {
        stateHandler(nil, ApiState.Loading, nil)
        let url = endPoint.endPointURL
        guard let url else {
            ApiService.apiState = ApiState.Error(message: "Fatal error")
            stateHandler(nil, ApiState.Error(message: "Fatal error"), "Fatal error")
            print("Fatal error")
            return
        }
        let request = buildRequest(url: url, endPoint: endPoint, body: body ?? nil)
        let task = ApiService.customConfigSession.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data else { return }
            if (400...499).contains(response.statusCode) {
                stateHandler(nil, ApiState.Error(message: "Client error"), "Client error")
                print("Client error")
            } else if (500...511).contains(response.statusCode) {
                stateHandler(nil, ApiState.Error(message: "Server error"), "Server error")
                print("Server error")
            } else if (200...226).contains(response.statusCode) {
                do {
                    let responseJson = try JSONSerialization.jsonObject(with: data, options: [])
                    print(responseJson)
                    let decodedData = try JSONDecoder().decode(U.self, from: data)
                    stateHandler(decodedData, ApiState.Success, nil)
                } catch let error {
                    print("Error in parsing data \(error.localizedDescription)")
                    stateHandler(nil, ApiState.Error(message: "Error in parsing response"), error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func makeCallWithoutBody<U: Codable>(
        endPoint: EndPoint,
        stateHandler: @escaping(U?, ApiState, String?) -> Void
    ) {
        stateHandler(nil, ApiState.Loading, nil)
        let url = endPoint.endPointURL
        guard let url else {
            ApiService.apiState = ApiState.Error(message: "Fatal error")
            stateHandler(nil, ApiState.Error(message: "Fatal error"), "Fatal error")
            print("Fatal error")
            return
        }
        let request = buildRequestWithoutBody(url: url, endPoint: endPoint)
        let task = ApiService.customConfigSession.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data else { return }
            if (400...499).contains(response.statusCode) {
                stateHandler(nil, ApiState.Error(message: "Client error"), "Client error")
                print("Client error")
            } else if (500...511).contains(response.statusCode) {
                stateHandler(nil, ApiState.Error(message: "Server error"), "Server error")
                print("Server error")
            } else if (200...226).contains(response.statusCode) {
                do {
                    let responseJson = try JSONSerialization.jsonObject(with: data, options: [])
                    print(responseJson)
                    let decodedData = try JSONDecoder().decode(U.self, from: data)
                    stateHandler(decodedData, ApiState.Success, nil)
                } catch let error {
                    print("Error in parsing data \(error.localizedDescription)")
                    stateHandler(nil, ApiState.Error(message: "Error in parsing response"), error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func buildRequest<T: Codable>(url: URL, endPoint: EndPoint, body: T? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod.rawValue
        for (header, value) in endPoint.headers {
            request.setValue(value, forHTTPHeaderField: header)
        }
        if let body {
            do {
                let encodedBody = try JSONEncoder().encode(body)
                request.httpBody = encodedBody
            } catch _ {
                print("Error in encoding the body")
            }
        }
        return request
    }
    
    func buildRequestWithoutBody(url: URL, endPoint: EndPoint) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod.rawValue
        for (header, value) in endPoint.headers {
            request.setValue(value, forHTTPHeaderField: header)
        }
        return request
    }
}
