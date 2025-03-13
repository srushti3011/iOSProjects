//
//  TableViewPassData.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/03/25.
//

import UIKit

class TableViewPassData: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.register(UINib(nibName: "ItemCellTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCellTableViewCell")
        itemTableView.delegate = self
        itemTableView.dataSource = self
    }
}

extension TableViewPassData: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCellTableViewCell", for: indexPath) as? ItemCellTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(row: indexPath.row)
        cell.delegate = self
        return cell
    }
}

extension TableViewPassData: DoNavigationAndSendData {
    func navigateAndSendData(tag: Int) {
        print(tag)
        let storyboard = UIStoryboard(name: "TableViewDataPassingStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewSelectedDataVC") as! ViewSelectedDataVC
        nextViewController.selectedContent = products[tag]
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
