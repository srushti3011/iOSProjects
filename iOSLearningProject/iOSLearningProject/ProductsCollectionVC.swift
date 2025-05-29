//
//  ProductsCollectionVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 15/05/25.
//

import UIKit

class ProductsCollectionVC: UIViewController {
    
    var products = [ResponseFromAPI]()
    
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        makeCall()
    }
    
    func configureCollectionView() {
        collectionViewProducts.delegate = self
        collectionViewProducts.dataSource = self
        collectionViewProducts.collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewProducts.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCell")
    }
    
    func makeCall() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        ApiService.sharedaApiCallInstance.getPosts(urlToCall: url!) { (response, error) in
            guard let response else {
                if let error {
                    print(error)
                }
                return
            }
            DispatchQueue.main.async {
                self.products = response
                self.collectionViewProducts.reloadData()
            }
            print(response)
        }
    }
}

extension ProductsCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(responseItem: products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewProducts.frame.size.width/2 - 5, height: collectionViewProducts.frame.size.height/3)
    }
}
