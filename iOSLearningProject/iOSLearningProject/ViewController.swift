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
        UserDefaults.standard.removeObject(forKey: "userToken")
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
        _ = AlamofireAPIService.shared.callEndpointWithBody(
            endPoint: EndPoint.createUser,
            body: CreateUserBody(name: "MYName", job: "MYJob")
        ) { (state: ApiState<CreatedUserResponse>) in
            switch state {
            case .Loading:
                self.lblAlamofireGenericState.text = "Loading"
            case .Error(let error):
                self.lblAlamofireGenericState.text = error.localizedDescription
            case .Success(let response):
                self.lblAlamofireGenericState.text = "\(response.id) \(response.name)"
            }
            
            _ = AlamofireAPIService.shared.callEndpointWithoutBody(
                endPoint: EndPoint.getSingleUser(userId: 2)
            ) { (state: ApiState<UserDetail>) in
                switch state {
                case .Loading:
                    print("loading user detail")
                case .Error(let error):
                    print("error \(error.localizedDescription)")
                case .Success(let response):
                    print(response)
                }
                
                _ = AlamofireAPIService.shared.callEndpointWithoutBody(
                    endPoint: EndPoint.getUserList(pageNo: 2)
                ) { (state: ApiState<UserList>) in
                    switch state {
                    case .Loading:
                        print("Loading users")
                    case .Error(let error):
                        print("Error fetching user list \(error.localizedDescription)")
                    case .Success(let response):
                        print(response.data[0])
                    }
                }
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
    
    @IBAction func btnGoToWebServicesExercise(_ sender: Any) {
        if let _ = UserDefaults.standard.string(forKey: "userToken") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "UserListAndCreationViewController") as! UserListAndCreationViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @IBAction func btnGoToArchitectureHome(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ArchitectureHomeVC") as? ArchitectureHomeVC
        if let nextViewController {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @IBAction func btnGoToPermissionsAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "PermissionsStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "PermissionsVC") as? PermissionsVC
        if let nextViewController {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
