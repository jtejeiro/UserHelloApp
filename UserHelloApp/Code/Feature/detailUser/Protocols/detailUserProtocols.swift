//
//  detailUserProtocols.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


// MARK: - View Protocol
protocol detailUserView: AnyObject {
    var presenter: detailUserPresenter? { get set }
    func showDetailUser(user:User)
    func showAlertError(title:String,message:String)
    
}

// MARK: - Presenter
protocol detailUserPresenter: AnyObject {
    
    var view: detailUserView? { get set }
    var interactor: detailUserInteractor? { get set }
    var router: detailUserRouter? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()

}


// MARK: - Interactor
protocol detailUserInteractorCallback: AnyObject {
    func fetchedDetailUser(result: Result< User, Error>)
}

protocol detailUserInteractor: AnyObject {
    var presenter: detailUserInteractorCallback? { get set }
    func fetchDetailUser(_ id:String)
    
}

// MARK: - Router
protocol detailUserRouter: AnyObject {
    func goBack()
}
