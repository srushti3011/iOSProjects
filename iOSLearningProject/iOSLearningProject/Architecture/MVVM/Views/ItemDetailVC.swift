//
//  ItemDetailVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 16/06/25.
//

import UIKit

class ItemDetailVC: UIViewController, Storyboarded {

    // MARK: Instance variables
    var coordinator: AuthenticatedScreens?
    
    // MARK: IBOutlets
    @IBOutlet weak var lblItemName: UILabel!
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItemName.text = coordinator?.selectedItem?.name
    }
}
