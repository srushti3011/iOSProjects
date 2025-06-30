//
//  ViperInteractor.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 17/06/25.
//

class ViperHomeInteractor: PresenterToInteractor {
    
    var presenter: (any InteractorToPresenter)?
    
    func callAddApi(numOne: Int, numTwo: Int) {
        let success = true
        let result = NetworkService.shared.addNumers(numOne: numOne, numTwo: numTwo)
        if success {
            presenter?.noticeAddApiSuccess(addedValue: result)
        } else {
            presenter?.noticeAddApiError(error: "Something went wrong")
        }
    }
}
