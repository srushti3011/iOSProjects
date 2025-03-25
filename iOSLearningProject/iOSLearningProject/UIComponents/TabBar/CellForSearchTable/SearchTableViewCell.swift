//
//  SearchTableViewCell.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 07/03/25.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var lblContentOfItem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(value: String) {
        lblContentOfItem.text = value
    }
    
}
