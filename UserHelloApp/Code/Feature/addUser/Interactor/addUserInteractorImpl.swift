//
//  addUserInteractorImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class addUserInteractorImpl {
    
    // MARK: - Properties
    weak var presenter: addUserInteractorCallback?
    
    // MARK: - Repository
   let service: BaseAPIClient
    
    // MARK: - Var
    
    init (service:BaseAPIClient) {
        self.service = service
    }
}

extension addUserInteractorImpl: addUserInteractor {
    
    // MARK: - fetch addUserInteractorImpl
    func fetchAddUser(parameters:[String:Any]){
        fetchAddUserApiClient(parameters: parameters)
    }
    
    
    // MARK: - fetch addUserInteractorImpl ApiCliente
    
    func fetchAddUserApiClient(parameters:[String:Any]) {
        let absolutePath = "api/User"
        
        service.postAPIRequest(relativePath: absolutePath, parameters: parameters).response{ (response) in
            debugPrint(response)
            
            switch response.result {
            case .success:
                self.presenter?.fetchedAddUser(result: .success("OK"))
                
            case let .failure(error):
                print(error)
                self.presenter?.fetchedAddUser(result: .failure(error))
            }
        }
    }
    
    
}
