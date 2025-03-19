//
//  HomeTabVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/03/25.
//

import UIKit

class HomeTabVC: UIViewController {

    @IBOutlet weak var btnFilterSearch: UIButton!
    @IBOutlet weak var txtFieldSearchCoffee: UITextField!
    @IBOutlet weak var viewHomeBanner: UIView!
    @IBOutlet weak var viewLblPromo: UIView!
    @IBOutlet weak var imgBannerBg: UIImageView!
    @IBOutlet weak var lblPromo: PaddedLabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var coffeeItemsCollectionView: UICollectionView!
    
    var selectedIndex: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
//        var viewControllers = navigationController?.viewControllers
//        if let index = viewControllers?.firstIndex(where: { $0 is OnboardingVC }) {
//            viewControllers?.remove(at: index)
//        }
//        navigationController?.viewControllers = viewControllers ?? []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewHomeBanner.layer.cornerRadius = 16
        imgBannerBg.layer.cornerRadius = 16
        viewLblPromo.layer.cornerRadius = 8
        lblPromo.layer.masksToBounds = true
        lblPromo.layer.cornerRadius = 8
        
        categoryCollectionView.backgroundColor = .clear
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        if let layout = categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        categoryCollectionView.register(UINib(nibName: "CoffeeCategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CoffeeCategoryCollectionCell")
        
        coffeeItemsCollectionView.delegate = self
        coffeeItemsCollectionView.dataSource = self
        coffeeItemsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        coffeeItemsCollectionView.register(UINib(nibName: "CoffeeItemCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CoffeeItemCollectionCell")
        
        categoryCollectionView.tag = 1
        coffeeItemsCollectionView.tag = 2
        
        txtFieldSearchCoffee.attributedPlaceholder = NSAttributedString(
                    string: "Search Coffee",
                    attributes: [
                        .foregroundColor: UIColor.gray
                    ]
                )
        btnFilterSearch.layer.cornerRadius = 12
    }
}

extension HomeTabVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return coffeeCollection.keys.count
        } else {
            return coffeeCollection[coffeeCategories[selectedIndex].categoryName]?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeCategoryCollectionCell", for: indexPath) as? CoffeeCategoryCollectionCell else {
                return UICollectionViewCell()
            }
            cell.delegate = self
            cell.index = indexPath.row
            cell.viewCategory.layer.cornerRadius = 10
            cell.btnCellCategory.setTitle(coffeeCategories[indexPath.row].categoryName, for: .normal)
            cell.btnCellCategory.layer.cornerRadius = 10
            if coffeeCategories[indexPath.row].isSelected {
                cell.btnCellCategory.backgroundColor = UIColor(named: "NavUiButtonBackgroundColor")
                cell.btnCellCategory.setTitleColor(UIColor(named: "whiteColor"), for: .normal)
            } else {
                cell.btnCellCategory.backgroundColor = UIColor(named: "notSelectedCategoryColor")
                cell.btnCellCategory.setTitleColor(UIColor(named: "notSelectedCategoryFont"), for: .normal)
                
            }
            return cell
        } else {
            guard let cell = coffeeItemsCollectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeItemCollectionCell", for: indexPath) as? CoffeeItemCollectionCell else {
                return UICollectionViewCell()
            }
            cell.delegate = self
            cell.index = indexPath.row
            let coffee = coffeeCollection[coffeeCategories[selectedIndex].categoryName]?[indexPath.row] ?? CoffeeItem(imgName: "", rating: 0, coffeeName: "", descriptionSmall: "", descriptionDetail: "", price: 0.0, availableVariants: "")
            cell.configureCoffeeItem(coffeeItem: coffee)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: categoryCollectionView.frame.size.width/3, height: categoryCollectionView.frame.size.height)
        } else {
//            return CGSize(width: coffeeItemsCollectionView.frame.size.width/2 - 5, height: view.frame.height / 3)
            return CGSize(width: coffeeItemsCollectionView.frame.size.width/2 - 5, height: view.frame.height * 0.26)
//            return CGSize(width: coffeeItemsCollectionView.frame.size.width/2 - 5, height: UICollectionViewFlowLayout.automaticSize.height)
        }
    }
}

extension HomeTabVC: CategorySelectedChange {
    func categorySelectionChanged(index: Int) {
        selectedIndex = index
        print("inside delegate")
        for (indexCoffee, _) in coffeeCategories.enumerated() {
            if indexCoffee == index {
                coffeeCategories[indexCoffee].isSelected = true
            } else {
                coffeeCategories[indexCoffee].isSelected = false
            }
        }
        categoryCollectionView.reloadData()
        coffeeItemsCollectionView.reloadData()
    }
}

extension HomeTabVC: ShowCoffeeDetail {
    func showDetailButtonPressed(index: Int) {
        let storyboard = UIStoryboard(name: "KtNavigationAndUiSB", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "CoffeeDetailViewController") as! CoffeeDetailViewController
        nextViewController.coffeeSelected = coffeeCollection[coffeeCategories[selectedIndex].categoryName]?[index]
        nextViewController.index = index
        nextViewController.delegate = self
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension HomeTabVC: SetUpLike {
    func coffeeLiked(index: Int) {
        print(index)
        coffeeCollection[coffeeCategories[selectedIndex].categoryName]?[index].isLiked = true
        coffeeItemsCollectionView.reloadData()
    }
}
