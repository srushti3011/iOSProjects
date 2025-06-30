//
//  ProductViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/06/25.
//

import UIKit

class ProductViewController: UIViewController, ProductFunctions, UITableViewDataSource, UITableViewDelegate {

    // MARK: Variables
    let productPresenter = ProductPresenter()
    var products: [ProductData]? = nil
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfProductName: UITextField!
    @IBOutlet weak var tfProductPrice: UITextField!
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        productPresenter.delegate = self
        productPresenter.getProducts()
        tfProductPrice.keyboardType = .numberPad
    }
    
    // MARK: IBActions
    @IBAction func btnAddProductAction(_ sender: Any) {
        if let productName = tfProductName.text,
           let productPrice = tfProductPrice.text {
            if let prodPrice = Int(productPrice) {
                productPresenter.addProduct(product: ProductData(name: productName, price: prodPrice))
            }
        }
    }
    
    // MARK: Private methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "productCell")
    }
}

extension ProductViewController {
    
    func presentProducts(products: [ProductData]) {
        self.products = products
        tableView.reloadData()
    }
}

extension ProductViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as? ProductCell,
            let product = products?[indexPath.row] {
            cell.configure(product: product)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
