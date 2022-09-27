//
//  ExtString.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit
import Foundation


extension String {

    var sLocalized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    func getStringtoDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = Kconstants.KDateFormatResponse
        return dateFormatter.date(from: self) ?? Date()
     }

}

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

