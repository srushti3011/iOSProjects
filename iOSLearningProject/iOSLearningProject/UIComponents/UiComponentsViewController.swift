//
//  UiComponentsViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 10/03/25.
//

import UIKit

class UiComponentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGoToScrollView(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ScrollView", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ScrollViewHorizontal") as! ScrollViewHorizontal
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToStepperTextField(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "TextFieldStepperStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "LblTxtFld") as! LblTxtFld
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToPageControl(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "PageControl", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToSegmentedControl(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SegmentedControl", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "SegmentedController") as! SegmentedController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToStepper(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Stepper", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "StepperController") as! StepperController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToTableView(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "UITableView", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    @IBAction func btnGoToCollectionView(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "UICollectionView", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    @IBAction func btnGoToTabBar(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "TabBarStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToMapAndPicker(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "MapAndPickerStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(identifier: "MapAndPickerViewController") as! MapAndPickerViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
