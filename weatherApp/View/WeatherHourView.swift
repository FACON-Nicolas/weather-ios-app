//
//  WeatherHourView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 08/03/2023.
//

import SwiftUI

struct WeatherHourView: View {
    
    var weatherHour: WeatherHour
    
    var body: some View {
        VStack {
            Text("\(weatherHour.hour)")
                .fontWeight(.bold)
            
            Spacer()
            
            WeatherIconView(name: WeatherData.getIconName(weather: weatherHour.weather))
                .padding()
            
            Spacer()
        
            Text("\(weatherHour.degrees)°")
        }
    }
}

struct WeatherHourView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHourView(weatherHour: WeatherHour(degrees: "9", weather: "rain", hour: "07"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
