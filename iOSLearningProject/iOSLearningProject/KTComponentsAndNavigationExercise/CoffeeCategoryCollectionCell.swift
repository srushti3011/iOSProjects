//
//  CoffeeCategoryCollectionCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/03/25.
//

import UIKit

protocol CategorySelectedChange: AnyObject {
    func categorySelectionChanged(index: Int)
}

class CoffeeCategoryCollectionCell: UICollectionViewCell {

    weak var delegate: CategorySelectedChange?
    var index: Int = 0
    @IBOutlet weak var btnCellCategory: UIButton!
    @IBOutlet weak var viewCategory: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func acnCategorySelected(_ sender: Any) {
//        btnCellCategory.backgroundColor = UIColor(named: "NavUiButtonBackgroundColor")
        print(index)
        delegate?.categorySelectionChanged(index: index)
    }
    
}
