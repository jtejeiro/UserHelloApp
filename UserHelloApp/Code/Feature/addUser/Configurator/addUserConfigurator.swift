//
//  addUserConfigurator.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation

@objc final class addUserConfigurator: NSObject {
    
    @objc class func createModule() -> UIViewController {
        
        let apiClient = BaseAPIClient()
        let view = addUserViewController()
        let presenter: addUserPresenterImpl = addUserPresenterImpl()
        let interactor = addUserInteractorImpl(service: apiClient)
        let router: addUserRouterImpl =  addUserRouterImpl(mainRouter: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    @objc class func createModulePopUp(_ delegate:UIViewController) -> UIViewController {
        
        let apiClient = BaseAPIClient()
        let view = addUserViewController()
        view.delegate = delegate as? addUserPopUpDelegate
        let presenter: addUserPresenterImpl = addUserPresenterImpl()
        let interactor = addUserInteractorImpl(service: apiClient)
        let router: addUserRouterImpl =  addUserRouterImpl(mainRouter: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

