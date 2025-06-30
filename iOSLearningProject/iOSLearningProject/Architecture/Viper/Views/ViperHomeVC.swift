//
//  ViperHomeVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 17/06/25.
//

import UIKit

final class ViperHomeVC: UIViewController {
    
    // MARK: Private variables
    private var presentor: (ViewToPresenter & InteractorToPresenter)?
    
    // MARK: IBOutlets
    @IBOutlet weak var textFieldNumTwo: UITextField!
    @IBOutlet weak var textFieldNumOne: UITextField!
    @IBOutlet weak var lblApiResult: UILabel!
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArchitecture()
    }
    
    // MARK: Private methods
    func setupArchitecture() {
        presentor = ViperHomePresenter()
        let interactor = ViperHomeInteractor()
        let router = ViperRouter()
        router.navigationController = self.navigationController
        interactor.presenter = presentor
        presentor?.interactor = interactor
        presentor?.router = router
        presentor?.view = self
        [textFieldNumOne, textFieldNumTwo].forEach { $0?.keyboardType = .numberPad }
    }
    
    // MARK: IBActions
    @IBAction func btnPerformAdditionClick(_ sender: UIButton) {
        presentor?.validateData(numOne: textFieldNumOne.text ?? "", numTwo: textFieldNumTwo.text ?? "")
        [textFieldNumOne, textFieldNumTwo].forEach { $0.resignFirstResponder() }
    }
}

// MARK: Extension for PresenterToView conformance
extension ViperHomeVC: PresenterToView {
    
    func inputProblem() {
        lblApiResult.text = "Enter valid input"
    }
    
    func apiSuccessUIChange(result: Int) {
        lblApiResult.text = String(result)
    }
    
    func apiFailureUIChange(error: String) {
        lblApiResult.text = error
    }
}
