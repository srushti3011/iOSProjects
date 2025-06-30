//
//  ViperHomePresenter.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 17/06/25.
//

import Dispatch
import UIKit

final class ViperHomePresenter: ViewToPresenter {
    
    var router: (any PresenterToRouter)?
    var interactor: (any PresenterToInteractor)?
    var view: (any PresenterToView)?

    func validateData(numOne: String, numTwo: String) {
        if let numOne = Int(numOne), let numTwo = Int(numTwo) {
            interactor?.callAddApi(numOne: numOne, numTwo: numTwo)
        } else {
            view?.inputProblem()
        }
    }
}

extension ViperHomePresenter: InteractorToPresenter {
    
    func noticeAddApiSuccess(addedValue: Int) {
        view?.apiSuccessUIChange(result: addedValue)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router?.navigateToNext(message: String(addedValue))
        }
    }
    
    func noticeAddApiError(error: String) {
        view?.apiFailureUIChange(error: error)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("Inside async after 3")
            self.router?.navigateToNext(message: error)
        }
    }
}
