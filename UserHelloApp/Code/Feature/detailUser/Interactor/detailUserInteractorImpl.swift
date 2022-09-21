//
//  detailUserInteractorImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class detailUserInteractorImpl {
    
    // MARK: - Properties
    weak var presenter: detailUserInteractorCallback?
    
    // MARK: - Repository
   let service: BaseAPIClient
    
    // MARK: - Var
    
    init (service:BaseAPIClient) {
        self.service = service
    }
}

extension detailUserInteractorImpl: detailUserInteractor {
    
    // MARK: - fetch detailUserInteractorImpl
    func fetchDetailUser(_ id:String) {
        fetchDetailUserApiClient(id)
    }
    
    // MARK: - fetch detailUserInteractorImpl ApiCliente
    
    func fetchDetailUserApiClient(_ id:String) {
        let absolutePath = "api/User"
        var urlString = absolutePath
        
        if !id.isEmpty {
            urlString += "/\(id)"
        }
        
        service.getAPIRequest(relativePath: urlString, parameters: [:]).response{ (response) in
            debugPrint(response)
            
            switch response.result {
            case .success:
                guard let data = response.data else {return}
                if let result = try? JSONDecoder().decode(User.self , from: data){
                    self.presenter?.fetchedDetailUser(result: .success(result))
                }
            case let .failure(error):
                print(error)
                self.presenter?.fetchedDetailUser(result: .failure(error))
            }
        }
    }
    
    
}
