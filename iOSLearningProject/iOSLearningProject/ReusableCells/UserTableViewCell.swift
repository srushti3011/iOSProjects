//
//  UserTableViewCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(data: DataForUser) {
        self.lblUserID.text = String(data.id)
        self.lblUserName.text = data.firstName
    }
}
