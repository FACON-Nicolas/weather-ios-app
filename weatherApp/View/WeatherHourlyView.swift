//
//  WeatherHourlyView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI

struct WeatherHourlyView: View {
    
    var hours: WeatherHours
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "clock")
                    Text("Weather hour by hour".uppercased())
                        .font(.system(size: 13))
                    Spacer()
                }
                .padding(.horizontal, 15)
                .foregroundColor(.white.opacity(0.5))
                Divider().padding(.horizontal, 10).padding(.bottom, 5)
            }
            .foregroundColor(.white.opacity(0.5))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(hours.hours) { item in
                        VStack {
                            WeatherHourView(weatherHour: item)
                        }
                    }
                }
            }
        }
        .padding(.vertical)
        .background(.black.opacity(0.05))
        .cornerRadius(12)
        .foregroundColor(.white)
        
    }
}

struct WeatherHourlyView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHourlyView(hours: WeatherHours(hours: [
            WeatherHour(degrees: "3", weather: "cloudy", hour: "1PM"),
            WeatherHour(degrees: "2", weather: "cloudy", hour: "2PM"),
            WeatherHour(degrees: "4", weather: "cloudy", hour: "3PM"),
            WeatherHour(degrees: "3", weather: "cloudy", hour: "4PM"),
            WeatherHour(degrees: "2", weather: "cloudy", hour: "5PM"),
            WeatherHour(degrees: "1", weather: "cloudy", hour: "6PM")
        ]))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color("SunnyDark"))
    }
}
