//
//  FirstViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 10/03/25.
//

import UIKit

class FirstViewController: UIViewController {

    var contentFromSecond: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("content from second: ")
        print(contentFromSecond)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func goToFirstScreen(segue: UIStoryboardSegue) {
    }
    
    @IBAction func goToSecondVC(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToSecond" {
            if let destination = segue.destination as? SecondViewController {
                print(destination)
                destination.contentPassed = "This is the content passed"
            }
        }
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
    }
}
