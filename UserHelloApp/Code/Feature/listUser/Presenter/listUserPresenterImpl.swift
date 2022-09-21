//
//  listUserPresenterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//
import UIKit
import Foundation


class listUserPresenterImpl{
    
    
    // MARK: - Properties
    weak var view: listUserView?
    var interactor: listUserInteractor?
    var router: listUserRouter?
    
    // MARK: - Var
    var listUserVM : listUserViewModel!
    
    // MARK: - Init
    init() {
    }
    
}

// MARK: - listUserPresenter methods
extension listUserPresenterImpl: listUserPresenter {

    func showDetailViewController(userID: String) {
        self.router?.routerDetailViewController(userID: userID)
    }
    func viewDidLoad() {
        self.interactor?.fetchlistUser()
    }
    
    func viewWillAppear() {
    }
    
    func viewDidAppear() {
        //
    }
    
    func showAddViewController() {
        router?.routerAddViewController()
    }
    
    func deleteListUser(_ id:String) {
        self.interactor?.fetchDeletelistUser(id)
    }
    
    func reloadListUserView() {
        self.interactor?.fetchlistUser()
    }
    
}
// MARK: - listUserInteractorCallback methods
extension listUserPresenterImpl: listUserInteractorCallback {
    
    func fetchedDeletelistUser(result: Result<String, Error>) {
        
        switch result {
          case .success(let data):
            print(data)
            self.reloadListUserView()
          case .failure(let error):
              print(error)
              view?.showAlertError(title: "Error", message: "check connection")
          }
    }
    
    
    func fetchedlistUser(result: Result< [User], Error>) {
        
        switch result {
          case .success(let data):
                let listResponse:[User] = data
                self.listUserVM = listUserViewModel.mapperTolistUserResponse(listUser: listResponse)
                view?.showlistUser(listUserVM: self.listUserVM)
          case .failure(let error):
              print(error)
              view?.showAlertError(title: "Error", message: "check connection")
          }
    }
    
    

}


// MARK: - Private methods
private extension listUserPresenterImpl {
    
  
}

