//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 1/2/24.
//

import Foundation

extension Date {
    
//    func convertToMonthYearFormat() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM yyyy"
//
//        return dateFormatter.string(from: self)
//    }
    
    func convertToMonthYearFormat() -> String {
//        use for different formats: formatted(.dateTime.month(.wide).year(.twoDigits))
        return formatted(.dateTime.month().year())
    }
}
