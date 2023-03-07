//
//  WeatherDaily.swift
//  weatherApp
//
//  Created by Nicolas FACON on 07/03/2023.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}

struct WeatherDaily {
    var minTemp: String
    var maxTemp: String
    var weather: String
    var day: String
}