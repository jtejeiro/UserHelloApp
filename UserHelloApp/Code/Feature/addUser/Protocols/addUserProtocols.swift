//
//  addUserProtocols.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


// MARK: - View Protocol
protocol addUserView: AnyObject {
    var presenter: addUserPresenter? { get set }
    func showAddUser()
    func showAlertError(title:String,message:String)
    
}

// MARK: - Presenter
protocol addUserPresenter: AnyObject {
    
    var view: addUserView? { get set }
    var interactor: addUserInteractor? { get set }
    var router: addUserRouter? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    
    func onBackAction()
    func onsendButtonAction(name:String,bDate:Date)
    
}


// MARK: - Interactor
protocol addUserInteractorCallback: AnyObject {
    func fetchedAddUser(result: Result< String, Error>)
}

protocol addUserInteractor: AnyObject {
    var presenter: addUserInteractorCallback? { get set }
    func fetchAddUser(parameters:[String:Any])
    
}

// MARK: - Router
protocol addUserRouter: AnyObject {
    func goBack()
    func goCloseViewController()
}


protocol addUserPopUpDelegate: AnyObject {
    func addUserCloseViewController()
}
