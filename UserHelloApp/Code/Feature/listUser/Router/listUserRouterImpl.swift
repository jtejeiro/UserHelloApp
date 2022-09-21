//
//  listUserRouterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation


class listUserRouterImpl {
    
    var mainRouter:UIViewController
    
    init(mainRouter: UIViewController) {
        self.mainRouter = mainRouter
    }
}
 // MARK: - listUserRouterImpl
extension listUserRouterImpl: listUserRouter  {
    
    func routerAddViewController() {
        let vc = addUserConfigurator.createModulePopUp(mainRouter)
        self.mainRouter.present(vc, animated: true, completion: nil)
    }
    
    func routerDetailViewController(userID:String) {
        let vc = detailUserConfigurator.createModule(userID: userID)
        self.mainRouter.navigationController?.pushViewController(vc, animated: false)
    }
    
    func goBack() {
           mainRouter.navigationController?.popViewController(animated: true)
       }
}



