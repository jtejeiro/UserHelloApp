//
//  DetailUserPresenterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class DetailUserPresenterImpl{
    
    // MARK: - Properties
    weak var view: DetailUserView?
    var interactor: DetailUserInteractor?
    var router: DetailUserRouter?
    
    // MARK: - Var
    var userID:String!
    
    // MARK: - Init
    init(userID:String) {
        self.userID = userID
    }
    
}

// MARK: - DetailUserPresenter methods
extension DetailUserPresenterImpl: DetailUserPresenter {
    
    func viewDidLoad() {
        self.interactor?.fetchDetailUser(userID)
    }
    
    func viewWillAppear() {
    }
    
    func viewDidAppear() {
        //
    }
    
}
// MARK: - DetailUserInteractorCallback methods
extension DetailUserPresenterImpl: DetailUserInteractorCallback {
    
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
private extension DetailUserPresenterImpl {
    
    func parameterDetailUserApiClient(name: String, bDate: String) -> [String:Any] {
        let parameter: [String:Any] = [ "name": name, "birthdate": bDate, "id": 0 ]
        return parameter
    }
  
}

