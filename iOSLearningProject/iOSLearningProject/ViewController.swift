//
//  ViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 24/02/25.
//

import UIKit
import SwiftUI
import PulseUI

class ViewController: UIViewController {
    
    @IBOutlet weak var lblAlamofireGenericState: UILabel!
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
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            return
        }
        ApiService.sharedaApiCallInstance.updatePostUsingPutRequest(urlToCall: url)
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
    
    @IBAction func btnGenericRequest(_ sender: Any) {
        ApiService.sharedaApiCallInstance.makeCallWithBody(
            endPoint: EndPoint.createUser,
            body: CreateUserBody(name: "MYName", job: "MYJob")
        ) { (data: CreatedUserResponse?, state, error) in
            switch state {
            case .Loading:
                print("Loading")
            case .Error(let message):
                print("Error \(message)")
            case .Success:
                if let data {
                    print("\(data.id) is created")
                }
            case .Cancelled:
                print("Cancelled")
            }
        }
    }
    
    //alamofire api calls
    @IBAction func btnGetUserAlamofire(_ sender: Any) {
        let userId = 2
        AlamofireAPIService.shared.getSingleUser(url: "https://reqres.in/api/users/\(String(userId))")
    }
    
    @IBAction func btnRegisterUserAlamofire(_ sender: Any) {
        AlamofireAPIService.shared.registerUser()
    }
    
    @IBAction func btnRequestWithQueryParam(_ sender: Any) {
        AlamofireAPIService.shared.getListOfUsers()
    }
    
    // generic alamofire call
    @IBAction func btnGenericAlamofireRequest(_ sender: Any) {
        let requestToCreateUser = AlamofireAPIService.shared.callEndpointWithBody(
            endPoint: EndPoint.createUser,
            body: CreateUserBody(name: "MYName", job: "MYJob")
        ) { (response: CreatedUserResponse?, state, error) in
            switch state {
            case .Loading:
                self.lblAlamofireGenericState.text = "Loading"
            case .Error(let message):
                self.lblAlamofireGenericState.text = message
            case .Success:
                if let response {
                    self.lblAlamofireGenericState.text = "\(response.id) \(response.name)"
                }
            case .Cancelled:
                print("Cancelled")
            }
        }
        
        let requestToGetSingleUser = AlamofireAPIService.shared.callEndpointWithoutBody(
            endPoint: EndPoint.getSingleUser(userId: 2)
        ) { (response: UserDetail?, state, error) in
            switch state {
            case .Loading:
                print("loading user detail")
            case .Error(let message):
                print("error \(message)")
            case .Success:
                if let response {
                    print(response)
                }
            case .Cancelled:
                print("Cancelled")
            }
        }
        
        let requestToGetUserList = AlamofireAPIService.shared.callEndpointWithoutBody(
            endPoint: EndPoint.getUserList(pageNo: 2)
        ) { (response: UserList?, state, error) in
            switch state {
            case .Loading:
                print("Loading users")
            case .Error(let message):
                print("Error fetching user list \(message)")
            case .Success:
                if let response {
                    print(response.data[0])
                }
            case .Cancelled:
                print("Cancelled")
            }
        }
    }
    
    @IBAction func btnCachedGetRequest(_ sender: Any) {
        ApiService.sharedaApiCallInstance.getPost(
            urlToCall: URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        ) { (response, error) in
            print(response!)
        }
    }
    
    @IBAction func btnOpenPulse(_ sender: Any) {
        let view = NavigationView {
            ConsoleView()
        }
        present(UIHostingController(rootView: view), animated: true)
    }
    
    @IBAction func btnGoToGrandCentralDispatch(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "GCDViewController") as! GCDViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnUILoadingAccordingToStates(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "UserListTableView") as! UserListTableView
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
