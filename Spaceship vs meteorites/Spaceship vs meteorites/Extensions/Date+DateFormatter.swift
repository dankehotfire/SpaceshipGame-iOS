//
//  Date+DateFormatter.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 09.05.2021.
//

import Foundation

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
