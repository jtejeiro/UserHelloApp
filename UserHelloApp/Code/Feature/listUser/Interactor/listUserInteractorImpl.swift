//
//  ListUserInteractorImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class ListUserInteractorImpl {
    
    // MARK: - Properties
    weak var presenter: ListUserInteractorCallback?
    
    // MARK: - Repository
   let service: BaseAPIClient
    
    // MARK: - Var
    
    init (service:BaseAPIClient) {
        self.service = service
    }
}

extension ListUserInteractorImpl: ListUserInteractor {
    
    // MARK: - fetch ListUserInteractorImpl
    func fetchListUser(){
        
        #if DEBUG
        if MockManager.shared.runAppWithMock{
            fetchListUserMock()
        }
        #endif
        
        fetchListUserApiClient()
    }
    
    func fetchDeleteListUser(_ id:String){
        fetchDeleteListUserApiClient(id)
    }
    
    // MARK: - fetch ListUserInteractorImpl ApiCliente
    
    func fetchListUserApiClient() {
        let absolutePath = "api/User"
        
        service.getAPIRequest(relativePath: absolutePath , parameters: ["id":6980]).response{ (response) in
            debugPrint(response)
            
            switch response.result {
            case .success:
                guard let data = response.data else {return}
                if let result = try? JSONDecoder().decode(UserElement.self , from: data){
                    self.presenter?.fetchedListUser(result: .success(result))
                }
            case let .failure(error):
                print(error)
                self.presenter?.fetchedListUser(result: .failure(error))
            }
        }
    }
    
    func fetchDeleteListUserApiClient(_ id:String) {
        let absolutePath = "api/User"
        
        service.deleteAPIRequest(relativePath: absolutePath, parameter: id).response{ (response) in
            debugPrint(response)
            
            switch response.result {
            case .success:
                self.presenter?.fetchedDeleteListUser(result: .success("OK"))
            case let .failure(error):
                print(error)
                self.presenter?.fetchedDeleteListUser(result: .failure(error))
            }
        }
    }
    
    
    func fetchListUserMock(){
        guard let model = Utils.parseJson(jsonName: "ListUser", model: UserElement.self ) else{
            self.presenter?.fetchedListUser(result: .failure(NetworkError.jsonDecoder))
            return
        }
        self.presenter?.fetchedListUser(result: .success(model))
    }
}
