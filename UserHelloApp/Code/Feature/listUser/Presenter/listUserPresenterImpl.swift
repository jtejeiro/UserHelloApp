//
//  ListUserPresenterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//
import UIKit
import Foundation


class ListUserPresenterImpl{
    
    
    // MARK: - Properties
    weak var view: ListUserView?
    var interactor: ListUserInteractor?
    var router: ListUserRouter?
    
    // MARK: - Var
    var listUserVM : ListUserViewModel!
    
    // MARK: - Init
    init() {
    }
    
}

// MARK: - ListUserPresenter methods
extension ListUserPresenterImpl: ListUserPresenter {

    func showDetailViewController(userID: String) {
        self.router?.routerDetailViewController(userID: userID)
    }
    func viewDidLoad() {
        self.interactor?.fetchListUser()
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
        self.interactor?.fetchDeleteListUser(id)
    }
    
    func reloadListUserView() {
        self.interactor?.fetchListUser()
    }
    
}
// MARK: - ListUserInteractorCallback methods
extension ListUserPresenterImpl: ListUserInteractorCallback {
    
    func fetchedDeleteListUser(result: Result<String, Error>) {
        
        switch result {
          case .success(let data):
            print(data)
            self.reloadListUserView()
          case .failure(let error):
              print(error)
              view?.showAlertError(title: "Error", message: "check connection")
          }
    }
    
    
    func fetchedListUser(result: Result< [User], Error>) {
        
        switch result {
          case .success(let data):
                let listResponse:[User] = data
                self.listUserVM = ListUserViewModel.mapperToListUserResponse(listUser: listResponse)
                view?.showListUser(listUserVM: self.listUserVM)
          case .failure(let error):
              print(error)
              view?.showAlertError(title: "Error", message: "check connection")
          }
    }
    
    

}


// MARK: - Private methods
private extension ListUserPresenterImpl {
    
  
}

