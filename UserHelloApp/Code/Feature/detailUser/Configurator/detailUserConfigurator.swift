//
//  detailUserConfigurator.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation

@objc final class detailUserConfigurator: NSObject {
    
    @objc class func createModule(userID:String) -> UIViewController {
        
        let apiClient = BaseAPIClient()
        let view = detailUserViewController()
        let presenter: detailUserPresenterImpl = detailUserPresenterImpl(userID: userID)
        let interactor = detailUserInteractorImpl(service: apiClient)
        let router: detailUserRouterImpl =  detailUserRouterImpl(mainRouter: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

