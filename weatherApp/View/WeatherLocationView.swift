//
//  WeatherLocationView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI

struct WeatherLocationView: View {
    
    var city: String
    @State var weather : WeatherModel = WeatherModel(city: "--", degrees: "", min: "", max: "", weather: "--")
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack {
                    Text(weather.city)
                        .font(.system(size: 30))
                        
                    Text(" \(weather.degrees)°")
                        .font(.system(size: 90))
                        .fontWeight(.light)
                    
                    Text(weather.weather)
                        .font(.system(size: 20))
                    
                    HStack {
                        Image(systemName: "arrow.up")
                        Text("\(weather.max)°C")
                        
                        Image(systemName: "arrow.down")
                        Text("\(weather.min)°C")
                    }
                }
                .shadow(radius: 3)
                .padding(50)
                
                WeatherHourlyView()
                    .padding(.horizontal)
                
                WeatherDailyView()
            }
            .foregroundColor(.white)
        }
        .background(LinearGradient(colors: [
            Color("SunnyLight"),
            Color("SunnyDark")
        ],
         startPoint: .top,
         endPoint: .bottom))
        .task {
            weather = await WeatherData.fetchWeather(city: city)
        }
    }
    
}

struct WeatherLocationView_Previews: PreviewProvider {
    static var previews:  some View {
        WeatherLocationView(city: "Paris")
    }
}
