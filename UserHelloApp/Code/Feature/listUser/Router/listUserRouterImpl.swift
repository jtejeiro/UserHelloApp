//
//  ListUserRouterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation


class ListUserRouterImpl {
    
    var mainRouter:UIViewController
    
    init(mainRouter: UIViewController) {
        self.mainRouter = mainRouter
    }
}
 // MARK: - ListUserRouterImpl
extension ListUserRouterImpl: ListUserRouter  {
    
    func routerAddViewController() {
        let vc = AddUserConfigurator.createModulePopUp(mainRouter)
        self.mainRouter.present(vc, animated: true, completion: nil)
    }
    
    func routerDetailViewController(userID:String) {
        let vc = DetailUserConfigurator.createModule(userID: userID)
        self.mainRouter.navigationController?.pushViewController(vc, animated: false)
    }
    
    func goBack() {
           mainRouter.navigationController?.popViewController(animated: true)
       }
}



