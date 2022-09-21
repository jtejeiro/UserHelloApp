//
//  BaseApiClient.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 19/9/22.
//

import UIKit
import Alamofire

class BaseAPIClient {

    private var baseURLAPI : URL {

        if let url = URL(string: Kconstants.KbaseUrl) {
               return url
           }else {
               return URL(string: "")!
           }
       }

    
    func getAPIRequest(relativePath: String , parameters:[ String : Any] ) -> DataRequest{
        let urlAbsolute = baseURLAPI.appendingPathComponent(relativePath)
        var parametersAbsolute:[ String : Any] = [:]
        
        if parameters.count > 0 {
            for key in parameters {
                parametersAbsolute[key.key] = key.value
            }
        }
        
        return AF.request(urlAbsolute, method: .get, parameters: parametersAbsolute , encoding: URLEncoding.default)
    }
    
    func postAPIRequest(relativePath: String , parameters:[ String : Any] ) -> DataRequest{
        let urlAbsolute = baseURLAPI.appendingPathComponent(relativePath)
        var parametersAbsolute:[ String : Any] = [:]
        
        if parameters.count > 0 {
            for key in parameters {
                parametersAbsolute[key.key] = key.value
            }
        }
        
        return AF.request(urlAbsolute, method: .post, parameters: parametersAbsolute , encoding: JSONEncoding.default)
    }
    
    func deleteAPIRequest(relativePath: String , parameter: String ) -> DataRequest{
        var urlString = relativePath
        
        if !parameter.isEmpty {
            urlString += "/\(parameter)"
        }
        
        let urlAbsolute = baseURLAPI.appendingPathComponent(urlString)
        
        return AF.request(urlAbsolute, method: .delete, parameters: nil, encoding: URLEncoding.default)
    }
}

