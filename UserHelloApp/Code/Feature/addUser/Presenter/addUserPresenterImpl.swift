//
//  addUserPresenterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class addUserPresenterImpl{
    
    
    // MARK: - Properties
    weak var view: addUserView?
    var interactor: addUserInteractor?
    var router: addUserRouter?
    
    // MARK: - Var
    
    // MARK: - Init
    init() {
    }
    
}

// MARK: - addUserPresenter methods
extension addUserPresenterImpl: addUserPresenter {
  
    func onBackAction() {
        router?.goCloseViewController()
    }
    
    func onsendButtonAction(name: String, bDate: Date) {
        let bDateString = bDate.getFormattedDate(format: Kconstants.KDateFormatResponse)
        let params = self.parameterAddUserApiClient(name: name, bDate: bDateString)
        self.interactor?.fetchAddUser(parameters: params)
    }
    
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
    }
    
    func viewDidAppear() {
        //
    }
    
}
// MARK: - addUserInteractorCallback methods
extension addUserPresenterImpl: addUserInteractorCallback {
    
    func fetchedAddUser(result: Result< String, Error>) {
        
        switch result {
          case .success(let data):
            print(data)
            view?.showAddUser()
          case .failure(let error):
              print(error)
              view?.showAlertError(title: "Error", message: "check connection")
          }
    }
    
    

}


// MARK: - Private methods
private extension addUserPresenterImpl {
    
    func parameterAddUserApiClient(name: String, bDate: String) -> [String:Any] {
        let parameter: [String:Any] = [ "name": name, "birthdate": bDate, "id": 0 ]
        return parameter
    }
  
}

