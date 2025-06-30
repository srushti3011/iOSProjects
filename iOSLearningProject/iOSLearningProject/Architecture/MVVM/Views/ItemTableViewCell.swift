//
//  ItemTableViewCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//

import UIKit

protocol ShowItemDetail: AnyObject {
    func showDetail(item: Item)
}

class ItemTableViewCell: UITableViewCell {
    
    // MARK: Instance variables
    var item: Item?
    weak var delegate: ShowItemDetail?
    
    // MARK: IBOutlets
    @IBOutlet weak var lblItemName: UILabel!
    
    // MARK: Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Instance methods
    func configureCell() {
        lblItemName.text = item?.name
    }
    
    // MARK: IBActions
    @IBAction func btnShowDetailAction(_ sender: Any) {
        if let item {
            delegate?.showDetail(item: item)
        }
    }
}
