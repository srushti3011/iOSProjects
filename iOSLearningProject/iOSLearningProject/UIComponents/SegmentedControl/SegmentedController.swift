//
//  SegmentedController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 27/02/25.
//

import UIKit

class SegmentedController: UIViewController {

//    MARK: -Outlets
    
    @IBOutlet weak var imgViewMainImage: UIImageView!
    @IBOutlet weak var segmentSelectOption: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSegmentedController()
        // Do any additional setup after loading the view.
    }
    
    func configureSegmentedController() {
        imgViewMainImage.image = UIImage(systemName: "book.pages")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//  MARK: - ACTIONS
    @IBAction func acnSegmentSelectionChanged(_ sender: Any) {
        let caseSelected = segmentSelectOption.selectedSegmentIndex
        print("Selection changed \(caseSelected)")
        switch caseSelected {
        case 0:
            imgViewMainImage.image = UIImage(systemName: "book.fill")
        case 1:
            imgViewMainImage.image = UIImage(systemName: "bag.fill")
        case 2:
            imgViewMainImage.image = UIImage(systemName: "sofa.fill")
        case 3:
            imgViewMainImage.image = UIImage(systemName: "mountain.2.fill")
        default:
            imgViewMainImage.image = UIImage(systemName: "book.pages")
        }
    }
}
