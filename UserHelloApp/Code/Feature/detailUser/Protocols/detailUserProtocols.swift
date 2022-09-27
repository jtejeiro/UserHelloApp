//
//  DetailUserProtocols.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


// MARK: - View Protocol
protocol DetailUserView: AnyObject {
    var presenter: DetailUserPresenter? { get set }
    func showDetailUser(user:User)
    func showAlertError(title:String,message:String)
    
}

// MARK: - Presenter
protocol DetailUserPresenter: AnyObject {
    
    var view: DetailUserView? { get set }
    var interactor: DetailUserInteractor? { get set }
    var router: DetailUserRouter? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()

}


// MARK: - Interactor
protocol DetailUserInteractorCallback: AnyObject {
    func fetchedDetailUser(result: Result< User, Error>)
}

protocol DetailUserInteractor: AnyObject {
    var presenter: DetailUserInteractorCallback? { get set }
    func fetchDetailUser(_ id:String)
    
}

// MARK: - Router
protocol DetailUserRouter: AnyObject {
    func goBack()
}
