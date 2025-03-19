//
//  CoffeeDetailViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 17/03/25.
//

import UIKit

protocol SetUpLike: AnyObject {
    func coffeeLiked(index: Int)
}

class CoffeeDetailViewController: UIViewController {
    
//    MARK: - Variables
    var coffeeSelected: CoffeeItem?
    var index: Int?
    var delegate: SetUpLike?
    
//    MARK: - Outlets
    @IBOutlet weak var lblCoffeePrice: UILabel!
    @IBOutlet weak var lblCoffeeDescriptionLong: UILabel!
    @IBOutlet weak var lblCoffeeRating: UILabel!
    @IBOutlet weak var lblDescriptionSmall: UILabel!
    @IBOutlet weak var lblCoffeeName: UILabel!
    @IBOutlet weak var btnBuyNow: UIButton!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var btnSizeLarge: UIButton!
    @IBOutlet weak var btnSizeMedium: UIButton!
    @IBOutlet weak var btnSizeSmall: UIButton!
    @IBOutlet weak var btnExtraMilk: UIButton!
    @IBOutlet weak var btnHighQualityBeans: UIButton!
    @IBOutlet weak var btnFastDelivery: UIButton!
    @IBOutlet weak var imgCoffeeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
        configureNavBar()
    }
    
//    MARK: - Functions
    func configureUI() {
        imgCoffeeImage.layer.cornerRadius = 16
        btnFastDelivery.layer.cornerRadius = 12
        btnHighQualityBeans.layer.cornerRadius = 12
        btnExtraMilk.layer.cornerRadius = 12
        btnSizeSmall.layer.cornerRadius = 12
        btnSizeMedium.layer.cornerRadius = 12
        btnSizeLarge.layer.cornerRadius = 12
        viewBottomContainer.layer.cornerRadius = 16
        btnSizeLarge.layer.borderWidth = 0.8
        btnSizeLarge.layer.borderColor = UIColor(named: "sizeButtonBorderColor")?.cgColor
        btnSizeMedium.layer.borderWidth = 0.8
        btnSizeMedium.layer.borderColor = UIColor(named: "sizeButtonBorderColor")?.cgColor
        btnSizeSmall.layer.borderWidth = 0.8
        btnSizeSmall.layer.borderColor = UIColor(named: "sizeButtonBorderColor")?.cgColor
        btnBuyNow.layer.cornerRadius = 16
        btnBuyNow.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func configureData() {
        imgCoffeeImage.image = UIImage(named: coffeeSelected?.imgName ?? "")
        lblCoffeeName.text = coffeeSelected?.coffeeName ?? ""
        lblDescriptionSmall.text = coffeeSelected?.descriptionSmall ?? ""
        guard let rating = coffeeSelected?.rating else {return}
        lblCoffeeRating.text = String(rating)
        lblCoffeeDescriptionLong.text = coffeeSelected?.descriptionDetail
        guard let price = coffeeSelected?.price else {return}
        lblCoffeePrice.text = "$ " + String(price)
    }
    
    func configureNavBar() {
        navigationItem.title = "Detail"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(tappedBackButton))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "TabHeart"), style: .plain, target: self, action: #selector(tappedRightButton))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedRightButton() {
        guard let indexSelected = index else {return}
        delegate?.coffeeLiked(index: indexSelected)
        print("tapped right bar button item")
    }
}
