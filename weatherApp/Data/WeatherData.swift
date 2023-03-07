//
//  WeatherAPICall.swift
//  weatherApp
//
//  Created by Nicolas FACON on 05/03/2023.
//

import Foundation
import SwiftUI

class WeatherData {
    
    private static var myDatas: [String:AnyObject] = [:]
    private static var myWeatherDatas: [String:AnyObject] = [:]
    private static var myWeatherDailyDatas: [[String:AnyObject]] = []
    private static var myAstronomyDatas: [String:AnyObject] = [:]
    private static var myConditionDatas: [String:AnyObject] = [:]

    static func fetchJson(city: String) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://wttr.in/\(city)?format=j2")!)
            let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
            myDatas = (json["current_condition"] as! [[String: AnyObject]])[0]
            myWeatherDailyDatas = (json["weather"] as! [[String: AnyObject]])
            myWeatherDatas = myWeatherDailyDatas[0]
            myConditionDatas = (myDatas["weatherDesc"] as! [[String: AnyObject]])[0]
            myAstronomyDatas = (myWeatherDailyDatas[0]["astronomy"] as! [[String:AnyObject]])[0] as [String:AnyObject]
        } catch {
            print("error")
        }
    }
    
    static func fetchWeather(city: String) async -> WeatherModel {
        await fetchJson(city: city)
        var weather = WeatherModel(city: "--", degrees: "0", min: "0", max: "0", weather: "--")
        weather.city = city
        weather.degrees = myDatas["temp_C"] as! String
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
    
    static func fetchDay(index: Int) -> WeatherDaily {
        let d = myWeatherDailyDatas[index]
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
        for i in 0..<myWeatherDailyDatas.count {
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
}
