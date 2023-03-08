//
//  WeatherHours.swift
//  weatherApp
//
//  Created by Nicolas FACON on 08/03/2023.
//

import Foundation

struct WeatherHours {
    var hours: [WeatherHour] = []
    
    mutating func append(_ weatherHour: WeatherHour) {
        self.hours.append(weatherHour)
    }
}
