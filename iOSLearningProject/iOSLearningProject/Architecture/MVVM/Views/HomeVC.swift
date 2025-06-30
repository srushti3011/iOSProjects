//
//  HomeVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//

import UIKit
import Combine

class HomeVC: UIViewController, Storyboarded {

    // MARK: Instance variables
    private var cancellables = Set<AnyCancellable>()
    var coordinator: AuthenticatedScreens?
    var items: [Item] = []
    var viewModel: HomeViewModel?
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        viewModel = HomeViewModel()
        viewModel?.getItems()
        viewModel?.$itemTableViewState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .Idle:
                    print("Idle")
                case .Success(data: let data):
                    print("Got data")
                    self?.items = data
                    self?.tableView.reloadData()
                case .Error(error: let error):
                    print("Error occured - \(error)")
                }
            }
            .store(in: &cancellables)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemTableViewCell
        if let cell {
            cell.item = items[indexPath.row]
            cell.delegate = self
            cell.configureCell()
            return cell
        } else { return UITableViewCell() }
    }
}

extension HomeVC: ShowItemDetail {
    func showDetail(item: Item) {
        coordinator?.selectedItem = item
        coordinator?.goToDetail()
    }
}
