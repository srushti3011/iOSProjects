//
//  TableViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 28/02/25.
//

import UIKit

struct TableRowData {
    let id: Int
    let name: String
}

struct TableSectionData {
    let identifier: UUID
    let title: String
    let sectionData: [TableRowData]
}

class TableViewController: UIViewController {
    
    let tableDataSource: [TableSectionData] = []

    var categories: [[String]] = [
        [
            "Clothing",
            "Medicines",
            "Utensils",
            "Grocery",
            "Furniture"
        ],
        [
            "Flat",
            "Bunglow",
            "Gold"
        ]
    ]
    
    var refreshControl: UIRefreshControl?
    
    var selectedCategories: Set<String> = []
    
//    MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var viewTableHeader: UIView!
    @IBOutlet var viewTableFooter: UIView!
//    @IBOutlet weak var lblHeaderContent: UILabel!
    @IBOutlet weak var lblShowDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        configureHeaderFooter()
//        navigationItem.rightBarButtonItem = editButtonItem
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(doRefresh), for: .valueChanged)
        self.tableView.addSubview(refreshControl!)
    }
    
    @objc func doRefresh() {
        print("Reloading the data")
        self.refreshControl?.endRefreshing()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "CellTypeOne", bundle: nil), forCellReuseIdentifier: "CellTypeOne")
        tableView.register(UINib(nibName: "AnimalCell", bundle: nil), forCellReuseIdentifier: "AnimalCell")
    }
    
    func configureHeaderFooter() {
        viewTableHeader.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 295)
        tableView.tableHeaderView = viewTableHeader
        viewTableFooter.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 293)
        tableView.tableFooterView = viewTableFooter
    }

    @IBAction func btnSubmitDetails(_ sender: Any) {
        print(selectedCategories)
        lblShowDetails.text = ""
        var str = ""
        selectedCategories.forEach { category in
            str = str + category + "\n"
        }
        print(str)
        lblShowDetails.text = str
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print(indexPath)
            let row = tableView.cellForRow(at: indexPath)
            row?.backgroundColor = UIColor(named: "LabelColor")
            selectedCategories.insert(categories[0][indexPath.row])
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            categories[indexPath.section].remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        switch (indexPath.section) {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellTypeOne") as? CellTypeOne else {
                return UITableViewCell()
            }
            cell.lblContentOfCell.text = categories[indexPath.section][indexPath.row]
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell") as? AnimalCell else {
                return UITableViewCell()
            }
            cell.textContent.text = categories[indexPath.section][indexPath.row]
            cell.btnShowDetail.setTitle("Edit value of \(categories[indexPath.section][indexPath.row])", for: .normal)
            cell.delegate = self
            cell.indexInfo = indexPath
            return cell
        default:
            cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section) Section"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension TableViewController: AnimalCellDelegate {
    func buttonPressed(title: String, index: IndexPath) {
        print("Pressed \(title) \(index.row)")
        categories[1][index.row] = "new val"
        tableView.reloadRows(at: [index], with: .fade)
    }
}
