//
//  WeatherDaily.swift
//  weatherApp
//
//  Created by Nicolas FACON on 07/03/2023.
//

import Foundation

struct WeatherDaily: Identifiable, Equatable {
    var id = UUID()
    var minTemp: Int
    var maxTemp: Int
    var day: String
}
