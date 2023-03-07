//
//  WeatherHourlyView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI

struct WeatherHourlyView: View {
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
                    ForEach(0..<20) { item in
                        VStack {
                            Text("\(item)h")
                                .fontWeight(.bold)
                            
                            WeatherIconView(name: "cloud.sun.rain.fill")
                                .padding()
                        
                            Text("\(9)°")
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
        WeatherHourlyView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
