//
//  AddUserPresenterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class AddUserPresenterImpl{
    
    
    // MARK: - Properties
    weak var view: AddUserView?
    var interactor: AddUserInteractor?
    var router: AddUserRouter?
    
    // MARK: - Var
    
    // MARK: - Init
    init() {
    }
    
}

// MARK: - AddUserPresenter methods
extension AddUserPresenterImpl: AddUserPresenter {
  
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
// MARK: - AddUserInteractorCallback methods
extension AddUserPresenterImpl: AddUserInteractorCallback {
    
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
private extension AddUserPresenterImpl {
    
    func parameterAddUserApiClient(name: String, bDate: String) -> [String:Any] {
        let parameter: [String:Any] = [ "name": name, "birthdate": bDate, "id": 0 ]
        return parameter
    }
  
}

