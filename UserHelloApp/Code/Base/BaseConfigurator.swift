//
//  BaseConfigurator.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 19/9/22.
//

import Foundation
import UIKit

class BaseConfigurator {
    
    var viewController: UIViewController {
        return createViewController()
    }
    
    
    private func createViewController() -> UIViewController {
        let view = listUserConfigurator.createModule()
        return view
    }
    
    static func ConfigGlobalApareance(){
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            navigationBarAppearance.backgroundColor = #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
            navigationBarAppearance.shadowColor = .clear
            navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
    
    
}
