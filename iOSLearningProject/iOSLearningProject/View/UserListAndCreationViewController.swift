//
//  UserListAndCreationViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import UIKit
import Combine

class UserListAndCreationViewController: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    @IBOutlet weak var userCreationState: UILabel!
    @IBOutlet weak var btnCreateUser: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressView: UIProgressView!
    let viewModel = UserListAndCreationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        registerCells()
        _  = viewModel.fetchListOfUsers()
        
        viewModel.$userListUIState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .idle:
                    break
                case .loading:
                    self?.showLoading()
                    self?.changeProgress(value: 0.5)
                case .success(_):
                    self?.reloadTableData()
                    self?.hideLoading()
                case .error(_):
                    self?.hideLoading()
                    self?.showError()
                }
            }
            .store(in: &cancellables)
        
        viewModel.$userCreationUIState
            .receive(on: DispatchQueue.main)
            .sink { [ weak self ] state in
                switch state {
                case .idle:
                    break
                case .loading:
                    self?.showLoading()
                    self?.changeProgress(value: 0.5)
                case .success(let data):
                    self?.hideLoading()
                    self?.userCreationSuccess(response: data)
                case .error(_):
                    self?.showError()
                }
            }
            .store(in: &cancellables)
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    @IBAction func btnCreateUser(_ sender: Any) {
        viewModel.createUser()
    }
    
    func reloadTableData() {
        DispatchQueue.main.async {
            self.progressView.progress = 1.0
            self.tableView.reloadData()
        }
    }
    
    func showLoading() {
        self.progressView.layer.isHidden = false
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.progressView.layer.isHidden = true
        }
    }
    
    func showError() {
        DispatchQueue.main.async {
            print("Can't load users")
        }
    }
    
    func userCreationSuccess(response: CreatedUserResponse) {
        DispatchQueue.main.async {
            self.userCreationState.text = "\(String(describing: response.id)) with \(String(describing: response.name)) created"
            self.progressView.progress = 1.0
        }
    }
    
    func changeProgress(value: Float) {
        DispatchQueue.main.async {
            self.progressView.progress = Float(value)
        }
    }
}

extension UserListAndCreationViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataForTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(data: viewModel.dataForTableView[indexPath.row])
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
}

extension UserListAndCreationViewController: ShowUserDetailClicked {
    func navigateToUserDetail(index: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        navigationController?.pushViewController(nextViewController, animated: true)
        nextViewController.idOfUser = viewModel.dataForTableView[index].user.id
    }
}
