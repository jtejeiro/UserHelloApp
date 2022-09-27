//
//  ListUserViewModel.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation

struct ListUserViewModel {
    var userList:[User]
    var orderBy:Bool = false
    
    static func mapperToListUserResponse(listUser:[User]) -> ListUserViewModel {
        return ListUserViewModel(userList: listUser)
    }
    
    mutating func orderByDateListUser() {
        var type = ComparisonResult.orderedDescending
        if orderBy {
           type = ComparisonResult.orderedAscending
        }
        
        userList = userList.sorted(by: ({ $0.getbirthdate().compare($1.getbirthdate()) == type}))
        orderBy = !orderBy
    }
    
}
