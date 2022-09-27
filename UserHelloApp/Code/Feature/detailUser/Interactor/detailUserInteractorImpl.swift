//
//  DetailUserInteractorImpl.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation


class DetailUserInteractorImpl {
    
    // MARK: - Properties
    weak var presenter: DetailUserInteractorCallback?
    
    // MARK: - Repository
   let service: BaseAPIClient
    
    // MARK: - Var
    
    init (service:BaseAPIClient) {
        self.service = service
    }
}

extension DetailUserInteractorImpl: DetailUserInteractor {
    
    // MARK: - fetch DetailUserInteractorImpl
    func fetchDetailUser(_ id:String) {
        
        #if DEBUG
        if MockManager.shared.runAppWithMock{
            fetchDetailUserMock()
        }
        #endif
        
        fetchDetailUserApiClient(id)
    }
    
    // MARK: - fetch DetailUserInteractorImpl ApiCliente
    
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
    func fetchDetailUserMock(){
        guard let model = Utils.parseJson(jsonName: "DetailUser", model: User.self ) else{
            self.presenter?.fetchedDetailUser(result: .failure(NetworkError.jsonDecoder))
            return
        }
        self.presenter?.fetchedDetailUser(result: .success(model))
    }
    
}
