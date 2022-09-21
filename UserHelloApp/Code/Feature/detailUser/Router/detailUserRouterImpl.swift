//
//  detailUserRouterImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation


class detailUserRouterImpl {
    
    var mainRouter:UIViewController
    
    init(mainRouter: UIViewController) {
        self.mainRouter = mainRouter
    }
}
 // MARK: - detailUserRouterImpl
extension detailUserRouterImpl: detailUserRouter  {
    
    func goBack() {
           mainRouter.navigationController?.popViewController(animated: true)
       }

}



