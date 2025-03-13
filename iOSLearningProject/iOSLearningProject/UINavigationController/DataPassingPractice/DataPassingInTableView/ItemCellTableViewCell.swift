//
//  ItemCellTableViewCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/03/25.
//

import UIKit

protocol DoNavigationAndSendData: AnyObject {
    func navigateAndSendData(tag: Int)
}

class ItemCellTableViewCell: UITableViewCell {
    
    weak var delegate: DoNavigationAndSendData?
    @IBOutlet weak var btnCell: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(row: Int) {
        print("in configure")
        print(row)
        btnCell.tag = row
        print("tag is")
        print(btnCell.tag)
        lblName.text = products[row].name
    }
    @IBAction func btnTapped(_ sender: UIButton) {
        delegate?.navigateAndSendData(tag: sender.tag)
    }
}
