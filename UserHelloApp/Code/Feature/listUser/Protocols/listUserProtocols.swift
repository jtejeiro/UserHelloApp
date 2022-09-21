//
//  listUserProtocols.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//
import Foundation


// MARK: - View Protocol
protocol listUserView: AnyObject {
    var presenter: listUserPresenter? { get set }
    func showlistUser(listUserVM:listUserViewModel)
    func showAlertError(title:String,message:String)
    
}

// MARK: - Presenter
protocol listUserPresenter: AnyObject {
    
    var view: listUserView? { get set }
    var interactor: listUserInteractor? { get set }
    var router: listUserRouter? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func showAddViewController()
    func showDetailViewController(userID:String)
    func deleteListUser(_ id:String)
    func reloadListUserView()
    
}


// MARK: - Interactor
protocol listUserInteractorCallback: AnyObject {
    func fetchedlistUser(result: Result< [User], Error>)
    func fetchedDeletelistUser(result: Result< String , Error>)
}

protocol listUserInteractor: AnyObject {
    var presenter: listUserInteractorCallback? { get set }
    func fetchlistUser()
    func fetchDeletelistUser(_ id:String)
    
}

// MARK: - Router
protocol listUserRouter: AnyObject {
    func routerAddViewController()
    func routerDetailViewController(userID:String)
//    func goBack()
}
