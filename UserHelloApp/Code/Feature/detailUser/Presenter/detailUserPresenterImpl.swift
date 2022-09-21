//
//  detailUserPresenterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class detailUserPresenterImpl{
    
    // MARK: - Properties
    weak var view: detailUserView?
    var interactor: detailUserInteractor?
    var router: detailUserRouter?
    
    // MARK: - Var
    var userID:String!
    
    // MARK: - Init
    init(userID:String) {
        self.userID = userID
    }
    
}

// MARK: - detailUserPresenter methods
extension detailUserPresenterImpl: detailUserPresenter {
    
    func viewDidLoad() {
        self.interactor?.fetchDetailUser(userID)
    }
    
    func viewWillAppear() {
    }
    
    func viewDidAppear() {
        //
    }
    
}
// MARK: - detailUserInteractorCallback methods
extension detailUserPresenterImpl: detailUserInteractorCallback {
    
    func fetchedDetailUser(result: Result< User, Error>) {
        
        switch result {
          case .success(let data):
            let detailResponse:User = data
            view?.showDetailUser(user:detailResponse)
          case .failure(let error):
              print(error)
              view?.showAlertError(title: "Error", message: "check connection")
          }
    }
    
    

}


// MARK: - Private methods
private extension detailUserPresenterImpl {
    
    func parameterdetailUserApiClient(name: String, bDate: String) -> [String:Any] {
        let parameter: [String:Any] = [ "name": name, "birthdate": bDate, "id": 0 ]
        return parameter
    }
  
}

