//
//  CoffeeData.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 13/03/25.
//

struct CoffeeItem {
    let imgName: String
    let rating: Double
    let coffeeName: String
    let descriptionSmall: String
    let descriptionDetail: String
    let price: Double
    let availableVariants: String
    var isLiked: Bool = false
}

var coffeeCollection: [String: [CoffeeItem]] = [
    "All Coffee" : [
        CoffeeItem(imgName: "CoffeeOne", rating: 4.8, coffeeName: "Caffe Mocha", descriptionSmall: "Deep Foam", descriptionDetail: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More", price: 4.53, availableVariants: "Ice/Hot"),
        CoffeeItem(imgName: "CoffeeTwo", rating: 4.5, coffeeName: "Flat White", descriptionSmall: "Espresso", descriptionDetail: "A Flat white is an approximately 200 ml (5 oz) beverage, with 40 ml of espresso coffee and 85ml of fresh milk the fo.. Read More", price: 3.53, availableVariants: "Ice"),
        CoffeeItem(imgName: "CoffeeThree", rating: 4.1, coffeeName: "Caffe Panna", descriptionSmall: "Espresso", descriptionDetail: "A Caffee Panna is refreshing coffee with...", price: 5.53, availableVariants: "Ice/Hot"),
        CoffeeItem(imgName: "CoffeeFour", rating: 4.9, coffeeName: "Mocha Fusi", descriptionSmall: "Deep Foam", descriptionDetail: "A Mocha Fusi is highest rated coffee which gives you a fresh feeling with great taste", price: 7.53, availableVariants: "Ice")
    ],
    "Machiato": [
        CoffeeItem(imgName: "CoffeeOne", rating: 4.8, coffeeName: "Caffe Mocha", descriptionSmall: "Deep Foam", descriptionDetail: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More", price: 4.53, availableVariants: "Ice/Hot")
    ],
    "Latte": [
        CoffeeItem(imgName: "CoffeeThree", rating: 4.1, coffeeName: "Caffe Panna", descriptionSmall: "Espresso", descriptionDetail: "A Caffee Panna is refreshing coffee with...", price: 5.53, availableVariants: "Ice/Hot"),
        CoffeeItem(imgName: "CoffeeFour", rating: 4.9, coffeeName: "Mocha Fusi", descriptionSmall: "Deep Foam", descriptionDetail: "A Mocha Fusi is highest rated coffee which gives you a fresh feeling with great taste", price: 7.53, availableVariants: "Ice")
    ],
    "Americano": [
        CoffeeItem(imgName: "CoffeeOne", rating: 4.8, coffeeName: "Caffe Mocha", descriptionSmall: "Deep Foam", descriptionDetail: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More", price: 4.53, availableVariants: "Ice/Hot"),
        CoffeeItem(imgName: "CoffeeTwo", rating: 4.5, coffeeName: "Flat White", descriptionSmall: "Espresso", descriptionDetail: "A Flat white is an approximately 200 ml (5 oz) beverage, with 40 ml of espresso coffee and 85ml of fresh milk the fo.. Read More", price: 3.53, availableVariants: "Ice")
    ]
]

struct CoffeeCategory {
    let categoryName: String
    var isSelected: Bool = false
}

var coffeeCategories: [CoffeeCategory] = [
    CoffeeCategory(categoryName: "All Coffee", isSelected: true),
    CoffeeCategory(categoryName: "Machiato", isSelected: false),
    CoffeeCategory(categoryName: "Latte", isSelected: false),
    CoffeeCategory(categoryName: "Americano", isSelected: false),
    
]
