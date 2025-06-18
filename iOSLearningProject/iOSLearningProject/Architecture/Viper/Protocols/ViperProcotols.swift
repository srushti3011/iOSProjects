//
//  ViperProcotols.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 17/06/25.
//

import Foundation
import UIKit

protocol ViewToPresenter: AnyObject {
    var view: PresenterToView? {get set}
    var interactor: PresenterToInteractor? {get set}
    var router: PresenterToRouter? {get set}
    func validateData(numOne: String, numTwo: String)
}

protocol PresenterToInteractor: AnyObject {
    var presenter: InteractorToPresenter? {get set}
    func callAddApi(numOne: Int, numTwo: Int)
}

protocol PresenterToRouter: AnyObject {
    func navigateToNext(message: String)
}

protocol InteractorToPresenter: AnyObject {
    func noticeAddApiSuccess(addedValue: Int)
    func noticeAddApiError(error: String)
}

protocol PresenterToView: AnyObject {
    func apiSuccessUIChange(result: Int)
    func apiFailureUIChange(error: String)
    func inputProblem()
}
