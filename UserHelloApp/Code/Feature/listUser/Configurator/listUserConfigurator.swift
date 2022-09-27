//
//  ListUserConfigurator.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation

@objc final class ListUserConfigurator: NSObject {
    
    @objc class func createModule() -> UIViewController {
        
        let apiClient = BaseAPIClient()
        let view = ListUserViewController()
        let presenter: ListUserPresenterImpl = ListUserPresenterImpl()
        let interactor = ListUserInteractorImpl(service: apiClient)
        let router: ListUserRouterImpl =  ListUserRouterImpl(mainRouter: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

