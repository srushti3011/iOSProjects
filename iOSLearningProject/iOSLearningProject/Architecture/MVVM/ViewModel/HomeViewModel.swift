//
//  HomeViewModel.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//
import Foundation

enum UIStateMVVM<T> {
    case Idle
    case Success(data: T)
    case Error(error: String)
}

class HomeViewModel {
    
    // MARK: Instance variables
    @Published private(set) var itemTableViewState: UIStateMVVM<[Item]> = .Idle
    var giveData = true
    
    // MARK: Instance methods
    func getItems() {
        if giveData {
            self.itemTableViewState = UIStateMVVM.Success(data: [
                Item(name: "Item 1", price: 200),
                Item(name: "Item 2", price: 500)
            ])
        } else {
            self.itemTableViewState = UIStateMVVM.Error(error: "Can't get data")
        }
    }
}
