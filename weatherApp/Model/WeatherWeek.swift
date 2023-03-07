//
//  WeatherWeek.swift
//  weatherApp
//
//  Created by Nicolas FACON on 07/03/2023.
//

import Foundation

struct WeatherWeek {
    var days : [WeatherDaily] = []
    var min: Double = Double.infinity
    var max: Double = -Double.infinity
    var degrees: Double?
}
