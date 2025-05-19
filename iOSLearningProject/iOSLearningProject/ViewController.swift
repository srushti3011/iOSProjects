//
//  ViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 24/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBasicAPICall(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "BasicApiCall") as! BasicApiCall
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnCollectionViewWithAPI(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ProductsCollectionVC") as! ProductsCollectionVC
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnMakePostRequest(_ sender: Any) {
        Task { @MainActor in
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
                return
            }
            ApiService.sharedaApiCallInstance.postPost(urlToCall: url)
        }
    }
    
    @IBAction func btnMakePutRequest(_ sender: Any) {
        Task { @MainActor in
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
                return
            }
            ApiService.sharedaApiCallInstance.updatePostUsingPutRequest(urlToCall: url)
        }
    }
    
    @IBAction func btnDeletePost(_ sender: Any) {
        Task { @MainActor in
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
                return
            }
            ApiService.sharedaApiCallInstance.deletePost(urlToCall: url)
        }
    }
    
    @IBAction func btnGetWithQueryParam(_ sender: Any) {
        Task { @MainActor in
            ApiService.sharedaApiCallInstance.getWithQueryParam(urlToCall: "https://jsonplaceholder.typicode.com/posts/1", queryParam: URLQueryItem(name: "postId", value: "1"))
        }
    }
    @IBAction func btnGetWithPathParam(_ sender: Any) {
//        Task { @MainActor in
//            ApiService.sharedaApiCallInstance.getWithPathParam(urlToCall: "https://reqres.in/api/users/", pathParam: "2")
//            ApiService().makeCall(method: RequestMethodType.GET, endPoint: EndPoint.users, queryParams: nil, pathParam: "2", headers: nil, body: nil)
            
//            1
//            ApiService().makeCall(
//                method: RequestMethodType.GET,
//                endPoint: EndPoint.users,
//                queryParams: [
//                    URLQueryItem(name: "page", value: "2")
//                ],
//                pathParam: nil,
//                headers: nil,
//                body: nil)
            
//            2
//            ApiService().makeCall(
//                method: RequestMethodType.GET,
//                endPoint: EndPoint.users,
//                queryParams: nil,
//                pathParam: nil,
//                headers: nil,
//                body: nil)
            
//            3
        ApiService.sharedaApiCallInstance.makeCall(
                modelType: UserCreated.self,
                method: RequestMethodType.POST,
                endPoint: EndPoint.users,
                queryParams: nil,
                pathParam: nil,
                headers: [
                    (Headers.Authorization, "reqres-free-v1"),
                    (Headers.ContentType, ContentType.json.rawValue)
                ],
                body: [
                    "name": "givenName",
                    "job": "Software dev."
                ]
        ) { (user: UserCreated?, error: String?) in
            if let user {
                print("In completion handler and got the user with id \(user.id)")
                print(user)
            } else {
                print("In completion handler else")
            }
        }
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
