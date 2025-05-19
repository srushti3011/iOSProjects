//
//  File.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 15/05/25.
//

import UIKit

class BasicApiCall: UIViewController {
    @IBOutlet weak var lblResponse: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://jsonplaceholder.typicode.com/p")
        ApiService.sharedaApiCallInstance.callAPI(urlToCall: url!) { (response, error, apiState) in
            switch apiState {
            case .Error:
                DispatchQueue.main.async {
                    self.lblResponse.text = "Error"
                }
            case .Loading:
                DispatchQueue.main.async {
                    self.lblResponse.text = "Loading"
                }
            case .GotNonEmptyResponse:
                guard let response else {
                    if let error {
                        print(error)
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.lblResponse.text = String(response.title)
                    print(response)
                }
                print(response)
            case .GotEmptyResponse:
                DispatchQueue.main.async {
                    self.lblResponse.text = "No response"
                }
                self.lblResponse.text = "No res"
            }
        }
    }
}
