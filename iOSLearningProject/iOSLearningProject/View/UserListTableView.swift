//
//  UserListTableView.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import UIKit
import Alamofire

class UserListTableView: UIViewController {
    
    @IBOutlet weak var lblLoading: UILabel!
    @IBOutlet weak var tableViewUser: UITableView!
    var viewModel = UserViewModel()
    var request: DataRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewUser.dataSource = self
        initializeViewModel()
        registerCells()
        print("Calling api")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        request?.cancel()
    }
    
    func initializeViewModel() {
        self.viewModel.reloadTableData = {
            DispatchQueue.main.async {
                self.tableViewUser.reloadData()
            }
        }
        self.viewModel.showLoading = {
            DispatchQueue.main.async {
                self.lblLoading.text = "Content is loading..."
            }
        }
        self.viewModel.hideLoading = {
            DispatchQueue.main.async {
                self.lblLoading.layer.isHidden = true
            }
        }
        self.viewModel.showError = {
            DispatchQueue.main.async {
                self.lblLoading.layer.isHidden = false
                self.lblLoading.text = "Error"
            }
        }
    }
    func registerCells() {
        tableViewUser.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    @IBAction func b(_ sender: Any) {
        sleep(2)
        request = viewModel.callAPI()
    }
}

extension UserListTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUser.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(data: viewModel.data[indexPath.row])
        return cell
    }
}
