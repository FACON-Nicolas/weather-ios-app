//
//  WeatherDaily.swift
//  weatherApp
//
//  Created by Nicolas FACON on 07/03/2023.
//

import Foundation

struct WeatherDaily: Identifiable, Equatable {
    
    static func == (lhs: WeatherDaily, rhs: WeatherDaily) -> Bool {
        lhs.id == rhs.id
    }
    
    func weather() -> String {
        var icons: [String] = []
        
        var iconsCount: [String:Int] = [:]
        
        for i in 0..<hours.hours.count {
            var ic = WeatherData.getIconName(weather: hours.hours[i].weather)
            icons.append(ic)
            if !iconsCount.keys.contains(ic) {
                iconsCount[ic] = 1
            } else {
                iconsCount[ic]! += 1
            }
        }
        
        let weather = iconsCount.max { $0.value < $1.value }
        
        return Array(iconsCount.keys)[0]
    }
    
    var id = UUID()
    var minTemp: Int
    var maxTemp: Int
    var day: String
    var hours: WeatherHours = WeatherHours()
}
