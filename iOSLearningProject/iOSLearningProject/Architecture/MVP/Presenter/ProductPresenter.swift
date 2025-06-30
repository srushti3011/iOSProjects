//
//  ProductPresenter.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/06/25.
//
import UIKit
protocol ProductFunctions {
    func presentProducts(products: [ProductData])
}

class ProductPresenter {
    var products = [
        ProductData(name: "ProductOne", price: 20),
        ProductData(name: "ProductTwo", price: 30),
        ProductData(name: "ProductThree", price: 40)
    ]
    var delegate: (ProductFunctions & UIViewController)? = nil
    
    
    
    func getProducts() {
        // ideally call the network service's function that makes call to an api
        delegate?.presentProducts(products: self.products)
    }
    
    func addProduct(product: ProductData) {
        self.products.append(product)
        delegate?.presentProducts(products: self.products)
    }
}
