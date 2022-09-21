//
//  User.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import Foundation

struct User: Codable{
    let id: Int
    var name: String? 
    let birthdate: String
    
    func getbirthdate() -> Date {
        return birthdate.getStringtoDate()
    }
    
    func formatBirtdate() -> String {
        return self.getbirthdate().getFormattedDate(format: "MMM dd,yyyy")
    }
    
    func getDayBirtdate() -> String{
        return self.getbirthdate().getFormattedDate(format: "dd")
    }
   
    func getMonthBirtdate() -> String{
        return self.getbirthdate().getFormattedDate(format: "MMM")
    }
}

typealias UserElement = [User]

