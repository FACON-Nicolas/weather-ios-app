//
//  WeatherAPICall.swift
//  weatherApp
//
//  Created by Nicolas FACON on 05/03/2023.
//

import Foundation
import SwiftUI

class WeatherData {
    
    private static var myDatas: [[String:AnyObject]] = []
    private static var myWeatherDatas: [String:AnyObject] = [:]
    private static var myAstronomyDatas: [String:AnyObject] = [:]
    private static var myConditionDatas: [String:AnyObject] = [:]
    private static var myWeatherHourlyDatas: [[String:AnyObject]] = []
    private static var myCurrentConditionDatas: [String:AnyObject] = [:]

    static func fetchJson(city: String) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://wttr.in/\(city)?format=j1")!)
            let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
            myDatas = (json["weather"] as! [[String: AnyObject]])
            myWeatherDatas = myDatas[0]
            myWeatherHourlyDatas = myWeatherDatas["hourly"] as! [[String:AnyObject]]
            myConditionDatas = (myWeatherHourlyDatas[0]["weatherDesc"] as! [[String: AnyObject]])[0]
            myCurrentConditionDatas = (json["current_condition"] as! [[String:AnyObject]])[0]
        } catch {
            print("error")
        }
    }
    
    static func fetchWeather(city: String) async -> WeatherModel {
        await fetchJson(city: city)
        var weather = WeatherModel(city: "--", degrees: "0", min: "0", max: "0", weather: "--")
        weather.city = city
        weather.degrees = myCurrentConditionDatas["temp_C"] as! String
        weather.min = myWeatherDatas["mintempC"] as! String
        weather.max = myWeatherDatas["maxtempC"] as! String
        weather.weather = myConditionDatas["value"] as! String
        return weather
    }
    
    static func dayOfWeek(date: String) -> String {
        let dateString = String(date.split(separator: " ")[0])
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let weekday = calendar.component(.weekday, from: date)
            let weekdayName = dateFormatter.weekdaySymbols[weekday - 1]
            let range = weekdayName.index(weekdayName.startIndex, offsetBy: 3)
            return String(weekdayName[..<range])
        } else {
            return ""
        }
    }
    
    static func getIconName(weather: String) -> String {
        if (weather.uppercased().contains("snow".uppercased())) {
            return "snowflake"
        } else if weather.uppercased().contains("rain".uppercased()) || weather.uppercased().contains("drizzle".uppercased()) || weather.uppercased().contains("sleet".uppercased()) {
            return "cloud.rain.fill"
        } else if weather.uppercased().contains("overcast".uppercased()) || weather.uppercased().contains("cloud".uppercased()) {
            return "cloud.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    static func getColorsName(weather: String) -> [Color] {
        let icon = getIconName(weather: weather)
        switch (icon) {
        case "snowflake", "sun.max.fill":
            return [
                Color("SunnyLight"),
                Color("SunnyDark")
            ]
        case "cloud.rain.fill":
            return [
                Color("RainLight"),
                Color("RainDark")
            ]
        default:
            return [
                Color("CloudyLight"),
                Color("CloudyDark")
            ]
        }
    }
    
    
    static func fetchDay(index: Int) -> WeatherDaily {
        let d = myDatas[index]
        let date = d["date"] as! String
        var day = WeatherDaily(minTemp: 0, maxTemp: 0, day: "")
        day.day = dayOfWeek(date: date)
        day.minTemp = Int(d["mintempC"] as! String)!
        day.maxTemp = Int(d["maxtempC"] as! String)!
        return day
    }
    
    static func fetchWeek() -> WeatherWeek {
        
        var days: [WeatherDaily] = []
        var week = WeatherWeek()
        for i in 0..<myDatas.count {
            let day = fetchDay(index: i)
            days.append(day)
            if Double(day.maxTemp) > week.max {
                week.max = Double(day.maxTemp)
            }
            if Double(day.minTemp) < week.min {
                week.min = Double(day.minTemp)
            }
        }
        
        week.days = days
        return week
    }
    
    static func getHour(index: Int) -> String {
        var hour = 3 * index
        var m = "AM"
        if (hour >= 12) {
            hour %= 12
            m = "PM"
        }
        if (hour == 0) {
            hour = 12
        }
        return String(hour) + " " + m
    }
    
    static func fetchHour(index: Int) -> WeatherHour {
        var weatherHour = WeatherHour(degrees: "", weather: "", hour: "")
        
        let hour = myWeatherHourlyDatas[index]
        weatherHour.degrees = hour["tempC"] as! String
        weatherHour.weather = (hour["weatherDesc"] as! [[String: AnyObject]])[0]["value"] as! String
        weatherHour.hour = getHour(index: index)
        return weatherHour
    }
    
    static func fetchHours() -> WeatherHours {
        
        var hours: WeatherHours = WeatherHours()
        
        for i in 0..<myWeatherHourlyDatas.count {
            hours.append(fetchHour(index: i))
        }
        return hours
    }
}
