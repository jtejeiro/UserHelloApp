//
//  addUserRouterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation


class addUserRouterImpl {
    
    var mainRouter:UIViewController
    
    init(mainRouter: UIViewController) {
        self.mainRouter = mainRouter
    }
}
 // MARK: - addUserRouterImpl
extension addUserRouterImpl: addUserRouter  {
    
    func goBack() {
           mainRouter.navigationController?.popViewController(animated: true)
       }
    
    func goCloseViewController() {
        mainRouter.dismiss(animated: true,completion: nil)
       }
}



