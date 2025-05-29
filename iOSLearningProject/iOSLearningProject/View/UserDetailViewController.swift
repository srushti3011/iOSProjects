//
//  UserDetailViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import UIKit
import Combine
import Kingfisher

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var imgUserAvatar: UIImageView!
    private var cancellables = Set<AnyCancellable>()
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    var idOfUser: Int? = nil
    let viewModel = UserDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let idOfUser {
            viewModel.getUserDetail(id: idOfUser)
        }
        viewModel.$userDetailUIState
            .receive(on: DispatchQueue.main)
            .sink { [ weak self ] state in
                switch state {
                case .idle:
                    break
                case .loading:
                    print("Loading user detail")
                case .success(let data):
                    self?.showUserData(user: data)
                case .error(let error):
                    print(error.localizedDescription)
                }
            }
            .store(in: &cancellables)
    }
    
    func showUserData(user: DataForUser) {
        DispatchQueue.main.async {
            self.imgUserAvatar.kf.setImage(with: URL(string: user.avatar))
            self.lblUserName.text = user.firstName + " " + user.lastName
            self.lblUserEmail.text = user.email
        }
    }
}
