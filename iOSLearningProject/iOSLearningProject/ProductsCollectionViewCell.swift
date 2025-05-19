//
//  ProductsCollectionViewCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 15/05/25.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(responseItem: ResponseFromAPI?) {
        lblTitle.text = responseItem?.title ?? "title"
        lblBody.text = responseItem?.body ?? "body"
    }
}
