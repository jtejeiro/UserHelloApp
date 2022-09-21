//
//  listUserConfigurator.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation

@objc final class listUserConfigurator: NSObject {
    
    @objc class func createModule() -> UIViewController {
        
        let apiClient = BaseAPIClient()
        let view = listUserViewController()
        let presenter: listUserPresenterImpl = listUserPresenterImpl()
        let interactor = listUserInteractorImpl(service: apiClient)
        let router: listUserRouterImpl =  listUserRouterImpl(mainRouter: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

