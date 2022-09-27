//
//  DetailUserRouterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation


class DetailUserRouterImpl {
    
    var mainRouter:UIViewController
    
    init(mainRouter: UIViewController) {
        self.mainRouter = mainRouter
    }
}
 // MARK: - DetailUserRouterImpl
extension DetailUserRouterImpl: DetailUserRouter  {
    
    func goBack() {
           mainRouter.navigationController?.popViewController(animated: true)
       }

}



