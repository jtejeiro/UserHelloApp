//
//  ListUserProtocols.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//
import Foundation


// MARK: - View Protocol
protocol ListUserView: AnyObject {
    var presenter: ListUserPresenter? { get set }
    func showListUser(listUserVM:ListUserViewModel)
    func showAlertError(title:String,message:String)
    
}

// MARK: - Presenter
protocol ListUserPresenter: AnyObject {
    
    var view: ListUserView? { get set }
    var interactor: ListUserInteractor? { get set }
    var router: ListUserRouter? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func showAddViewController()
    func showDetailViewController(userID:String)
    func deleteListUser(_ id:String)
    func reloadListUserView()
    
}


// MARK: - Interactor
protocol ListUserInteractorCallback: AnyObject {
    func fetchedListUser(result: Result< [User], Error>)
    func fetchedDeleteListUser(result: Result< String , Error>)
}

protocol ListUserInteractor: AnyObject {
    var presenter: ListUserInteractorCallback? { get set }
    func fetchListUser()
    func fetchDeleteListUser(_ id:String)
    
}

// MARK: - Router
protocol ListUserRouter: AnyObject {
    func routerAddViewController()
    func routerDetailViewController(userID:String)
//    func goBack()
}
