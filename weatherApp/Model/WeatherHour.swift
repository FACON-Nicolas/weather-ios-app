//
//  WeatherHour.swift
//  weatherApp
//
//  Created by Nicolas FACON on 07/03/2023.
//

import Foundation

struct WeatherHour: Identifiable {
    var id = UUID()
    var degrees: String
    var weather : String
    var hour: String
    var date: String
    
}
