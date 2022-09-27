//
//  AddUserInteractorImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class AddUserInteractorImpl {
    
    // MARK: - Properties
    weak var presenter: AddUserInteractorCallback?
    
    // MARK: - Repository
   let service: BaseAPIClient
    
    // MARK: - Var
    
    init (service:BaseAPIClient) {
        self.service = service
    }
}

extension AddUserInteractorImpl: AddUserInteractor {
    
    // MARK: - fetch AddUserInteractorImpl
    func fetchAddUser(parameters:[String:Any]){
        fetchAddUserApiClient(parameters: parameters)
    }
    
    
    // MARK: - fetch AddUserInteractorImpl ApiCliente
    
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
