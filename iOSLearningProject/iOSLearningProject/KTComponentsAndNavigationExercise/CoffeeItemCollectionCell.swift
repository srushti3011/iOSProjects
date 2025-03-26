//
//  CoffeeItemCollectionCell.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/03/25.
//

import UIKit

protocol ShowCoffeeDetail: AnyObject {
    func showDetailButtonPressed(index: Int)
}

class CoffeeItemCollectionCell: UICollectionViewCell {

    @IBOutlet weak var viewFullCell: UIView!
    @IBOutlet weak var coffeeImg: UIImageView!
    @IBOutlet weak var lblCoffeeName: UILabel!
    @IBOutlet weak var lblCoffeeDescriptionSmall: UILabel!
    @IBOutlet weak var lblCoffeePrice: UILabel!
    @IBOutlet weak var lblCoffeeRating: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var viewRatingContainer: UIView!
    
    weak var delegate: ShowCoffeeDetail?
    var index: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCoffeeItem(coffeeItem: CoffeeItem) {
        coffeeImg.image = UIImage(named: coffeeItem.imgName)
        coffeeImg.layer.cornerRadius = 10
        lblCoffeeName.text = coffeeItem.coffeeName
        lblCoffeeDescriptionSmall.text = coffeeItem.descriptionSmall
        lblCoffeePrice.text = "$ " + String(coffeeItem.price)
        lblCoffeeRating.text = String(coffeeItem.rating)
        btnAdd.layer.cornerRadius = 5
        viewFullCell.layer.cornerRadius = 10
        
        viewRatingContainer.layer.cornerRadius = 5
        
        if coffeeItem.isLiked {
            viewRatingContainer.backgroundColor = UIColor(named: "LikedCoffeeBg")
        } else {
            viewRatingContainer.backgroundColor = UIColor(named: "RatingContainerBgColor")
        }
        
        
    }

    @IBAction func acnCoffeeDetailBtnPressed(_ sender: Any) {
        delegate?.showDetailButtonPressed(index: index)
    }
}
