//
//  DetailUserConfigurator.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation

@objc final class DetailUserConfigurator: NSObject {
    
    @objc class func createModule(userID:String) -> UIViewController {
        
        let apiClient = BaseAPIClient()
        let view = DetailUserViewController()
        let presenter: DetailUserPresenterImpl = DetailUserPresenterImpl(userID: userID)
        let interactor = DetailUserInteractorImpl(service: apiClient)
        let router: DetailUserRouterImpl =  DetailUserRouterImpl(mainRouter: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

