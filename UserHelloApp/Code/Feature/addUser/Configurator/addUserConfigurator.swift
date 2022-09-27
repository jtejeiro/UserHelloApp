//
//  AddUserConfigurator.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation

@objc final class AddUserConfigurator: NSObject {
    
    @objc class func createModule() -> UIViewController {
        
        let apiClient = BaseAPIClient()
        let view = AddUserViewController()
        let presenter: AddUserPresenterImpl = AddUserPresenterImpl()
        let interactor = AddUserInteractorImpl(service: apiClient)
        let router: AddUserRouterImpl =  AddUserRouterImpl(mainRouter: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    @objc class func createModulePopUp(_ delegate:UIViewController) -> UIViewController {
        
        let apiClient = BaseAPIClient()
        let view = AddUserViewController()
        view.delegate = delegate as? AddUserPopUpDelegate
        let presenter: AddUserPresenterImpl = AddUserPresenterImpl()
        let interactor = AddUserInteractorImpl(service: apiClient)
        let router: AddUserRouterImpl =  AddUserRouterImpl(mainRouter: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

