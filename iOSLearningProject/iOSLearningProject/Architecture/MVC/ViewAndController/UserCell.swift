//
//  UserCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/06/25.
//

import UIKit

class UserCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserCity: UILabel!
    @IBOutlet weak var lblUserAge: UILabel!
    
    // MARK: Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Instance methods
    func configureCell(user: UserData) {
        lblUserName.text = user.name
        lblUserCity.text = user.city
        lblUserAge.text = String(user.age)
    }
}
