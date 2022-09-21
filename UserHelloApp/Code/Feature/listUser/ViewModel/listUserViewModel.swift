//
//  listUserViewModel.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation

struct listUserViewModel {
    var userList:[User]
    var orderBy:Bool = false
    
    static func mapperTolistUserResponse(listUser:[User]) -> listUserViewModel {
        return listUserViewModel(userList: listUser)
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
