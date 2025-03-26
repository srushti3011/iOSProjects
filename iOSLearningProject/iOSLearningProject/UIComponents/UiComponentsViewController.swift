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
    
    @IBAction func btnGoToChatScreen(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ChatStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnGoToScheduleScreen(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ScheduleManagementStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ScheduleViewController") as! ScheduleViewController
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
