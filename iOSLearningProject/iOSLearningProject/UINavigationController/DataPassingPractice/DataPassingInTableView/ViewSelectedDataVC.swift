//
//  ViewSelectedDataVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 12/03/25.
//

import UIKit

class ViewSelectedDataVC: UIViewController {
    
    var selectedContent: Item?

    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelsToSelectedContent()
    }
    
    func setLabelsToSelectedContent() {
        lblProductName.text = selectedContent?.name
        lblProductDescription.text = selectedContent?.description
    }
}
