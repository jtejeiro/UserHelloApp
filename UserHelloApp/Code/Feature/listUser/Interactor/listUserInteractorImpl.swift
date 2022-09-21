//
//  listUserInteractorImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class listUserInteractorImpl {
    
    // MARK: - Properties
    weak var presenter: listUserInteractorCallback?
    
    // MARK: - Repository
   let service: BaseAPIClient
    
    // MARK: - Var
    
    init (service:BaseAPIClient) {
        self.service = service
    }
}

extension listUserInteractorImpl: listUserInteractor {
    
    // MARK: - fetch listUserInteractorImpl
    func fetchlistUser(){
        fetchlistUserApiClient()
    }
    
    func fetchDeletelistUser(_ id:String){
        fetchDeletelistUserApiClient(id)
    }
    
    // MARK: - fetch listUserInteractorImpl ApiCliente
    
    func fetchlistUserApiClient() {
        let absolutePath = "api/User"
        
        service.getAPIRequest(relativePath: absolutePath , parameters: ["id":6980]).response{ (response) in
            debugPrint(response)
            
            switch response.result {
            case .success:
                
                guard let data = response.data else {return}
                if let result = try? JSONDecoder().decode(UserElement.self , from: data){
                    self.presenter?.fetchedlistUser(result: .success(result))
                }
            case let .failure(error):
                print(error)
                self.presenter?.fetchedlistUser(result: .failure(error))
            }
        }
    }
    
    func fetchDeletelistUserApiClient(_ id:String) {
        let absolutePath = "api/User"
        
        service.deleteAPIRequest(relativePath: absolutePath, parameter: id).response{ (response) in
            debugPrint(response)
            
            switch response.result {
            case .success:
                self.presenter?.fetchedDeletelistUser(result: .success("OK"))
            case let .failure(error):
                print(error)
                self.presenter?.fetchedDeletelistUser(result: .failure(error))
            }
        }
    }
    
}
