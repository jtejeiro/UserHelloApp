//
//  AddUserProtocols.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


// MARK: - View Protocol
protocol AddUserView: AnyObject {
    var presenter: AddUserPresenter? { get set }
    func showAddUser()
    func showAlertError(title:String,message:String)
    
}

// MARK: - Presenter
protocol AddUserPresenter: AnyObject {
    
    var view: AddUserView? { get set }
    var interactor: AddUserInteractor? { get set }
    var router: AddUserRouter? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    
    func onBackAction()
    func onsendButtonAction(name:String,bDate:Date)
    
}


// MARK: - Interactor
protocol AddUserInteractorCallback: AnyObject {
    func fetchedAddUser(result: Result< String, Error>)
}

protocol AddUserInteractor: AnyObject {
    var presenter: AddUserInteractorCallback? { get set }
    func fetchAddUser(parameters:[String:Any])
    
}

// MARK: - Router
protocol AddUserRouter: AnyObject {
    func goBack()
    func goCloseViewController()
}


protocol AddUserPopUpDelegate: AnyObject {
    func addUserCloseViewController()
}
