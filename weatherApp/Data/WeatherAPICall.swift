//
//  WeatherAPICall.swift
//  weatherApp
//
//  Created by Nicolas FACON on 05/03/2023.
//

import Foundation
import SwiftUI
import WebKit

class WeatherData {
    
    private static var myDatas: [String:AnyObject] = [:]
    private static var myWeatherDatas: [String:AnyObject] = [:]
    private static var myConditionDatas: [String:AnyObject] = [:]

    static func fetchJson(city: String) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://wttr.in/\(city)?format=j2")!)
            let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
            myDatas = ((json["current_condition"] as! NSArray)[0] as! Dictionary<String, AnyObject>)
            myWeatherDatas = ((json["weather"] as! NSArray)[0] as! Dictionary<String, AnyObject>)
            myConditionDatas = ((myDatas["weatherDesc"] as! NSArray)[0] as! Dictionary<String, AnyObject>)
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
}
