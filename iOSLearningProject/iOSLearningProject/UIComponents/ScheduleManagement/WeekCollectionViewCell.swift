//
//  WeekCollectionViewCell.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 06/03/25.
//

import UIKit

class WeekCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewSelectedDay: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewSelectedDay.layer.cornerRadius = 5
    }

}
