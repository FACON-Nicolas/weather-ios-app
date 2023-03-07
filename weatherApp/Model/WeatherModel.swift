//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Nicolas FACON on 05/03/2023.
//

import Foundation

struct WeatherModel: Identifiable {
    var id = UUID()
    var city: String
    var degrees : String
    var min: String
    var max: String
    var weather: String
}


