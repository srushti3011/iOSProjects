//
//  ProductCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/06/25.
//

import UIKit

class ProductCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var lblProductName: UILabel!
    
    // MARK: Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Instance methods
    func configure(product: ProductData) {
        lblProductName.text = product.name
    }
}
