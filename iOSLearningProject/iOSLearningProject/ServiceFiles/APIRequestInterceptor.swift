//
//  RequestInterceptor.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 22/05/25.
//

import Foundation
import Alamofire

final class APIRequestInterceptor: RequestInterceptor {
    
    private let retryLimit = 3
    private var retryCount = [URL: Int]()
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        request.addValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")
        print("Adapting request: \(request.url?.absoluteString ?? "")")
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("Retrying")
        guard let url = request.request?.url else {
            completion(.doNotRetry)
            return
        }
        let count = retryCount[url] ?? 0
        if count < retryLimit {
            retryCount[url] = count + 1
            print("Retrying request: \(url), attempt: \(count + 1)")
            completion(.retryWithDelay(1.0)) // Retry after 1 second
        } else {
            print("Retry limit reached for: \(url)")
            completion(.doNotRetry)
        }
    }
}
