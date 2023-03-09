//
//  WeatherLocationView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import CoreLocation
import SwiftUI
import CoreLocation

struct WeatherLocationView: View {
    
    @State var city: String = "Paris"
    @State var weather : WeatherModel = WeatherModel(city: "--", degrees: "", min: "", max: "", weather: "--")
    @State var week : WeatherWeek = WeatherWeek()
    @State var hours: WeatherHours = WeatherHours()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack {
                    Text(weather.city.capitalized)
                        .font(.system(size: 30))
                    
                    Text(" \(weather.degrees)°")
                        .font(.system(size: 90))
                        .fontWeight(.light)
                    
                    Text(weather.weather)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Image(systemName: "arrow.up")
                        Text("\(weather.max)°C")
                        
                        Image(systemName: "arrow.down")
                        Text("\(weather.min)°C")
                    }
                }
                .shadow(radius: 3)
                .padding(50)
                
                WeatherHourlyView(hours: hours)
                    .padding(.horizontal)
                
                WeatherDailyView(week: week)
                
                
                
            }
            .foregroundColor(.white)
            .task {
                weather = await WeatherData.fetchWeather(city: city)
                weather.city = city
                week = WeatherData.fetchWeek()
                week.degrees = Double(weather.degrees)!
                hours = WeatherData.fetchHours()
            }
        }
        .background(LinearGradient(colors: WeatherData.getColorsName(weather: weather.weather),
                                   startPoint: .top,
                                   endPoint: .bottom))
    }
    
}

struct WeatherLocationView_Previews: PreviewProvider {
    static var previews:  some View {
        WeatherLocationView()
    }
}
