//
//  MVCHomeVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 18/06/25.
//

import UIKit

class MVCHomeVC: UIViewController {

    // MARK: Variables
    private let users = [
        UserData(name: "UserOne", age: 10, city: "CityOne"),
        UserData(name: "UserTwo", age: 15, city: "CityTwo"),
        UserData(name: "UserThree", age: 20, city: "CityThree")
    ]
    
    // MARK: IBOutlets
    @IBOutlet weak var viewDisplayColor: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnGetUser: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
    }
    
    // MARK: IBActions
    @IBAction func btnRedAction(_ sender: Any) {
        setColor(color: self.getColor(color: Colors.Red))
    }
    
    @IBAction func btnGreenAction(_ sender: Any) {
        setColor(color: self.getColor(color: Colors.Green))
    }
    
    @IBAction func btnYellowAction(_ sender: Any) {
        setColor(color: self.getColor(color: Colors.Yellow))
    }
    
    
    // MARK: Private menthods
    private func setColor(color: UIColor) {
        self.viewDisplayColor.backgroundColor = color
    }
    
    private func getColor(color: Colors) -> UIColor {
        switch(color) {
        case .Red:
            UIColor.red
        case .Green:
            UIColor.green
        case .Yellow:
            UIColor.yellow
        }
    }
}

extension MVCHomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell
        if let cell {
            cell.configureCell(user: users[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension MVCHomeVC: UITableViewDelegate {
}
