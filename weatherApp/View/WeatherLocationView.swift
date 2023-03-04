//
//  WeatherLocationView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI

struct WeatherLocationView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack {
                    Text("Lyon")
                        .font(.system(size: 30))
                        
                    Text(" 10°")
                        .font(.system(size: 90))
                        .fontWeight(.light)
                    
                    Text("Sunny")
                        .font(.system(size: 20))
                    
                    HStack {
                        Image(systemName: "arrow.up")
                        Text("11°C")
                        
                        Image(systemName: "arrow.down")
                        Text("3°C")
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
    }
}

struct WeatherLocationView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLocationView()
    }
}
