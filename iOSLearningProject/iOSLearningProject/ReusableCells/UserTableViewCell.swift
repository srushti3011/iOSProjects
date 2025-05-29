//
//  UserTableViewCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import UIKit

protocol ShowUserDetailClicked: AnyObject {
    func navigateToUserDetail(index: Int)
}

class UserTableViewCell: UITableViewCell {

    var index: Int?
    weak var delegate: ShowUserDetailClicked?
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserID: UILabel!
    
    @IBAction func btnShowDetail(_ sender: Any) {
        if let index {
            delegate?.navigateToUserDetail(index: index)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(data: UserListData) {
        self.lblUserID.text = String(data.user.id)
        self.lblUserName.text = data.user.firstName
    }
}
