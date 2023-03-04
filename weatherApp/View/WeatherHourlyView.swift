//
//  WeatherHourlyView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI

struct WeatherHourlyView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { item in
                    VStack {
                        Text("\(item)h")
                            .fontWeight(.bold)
                        
                        WeatherIconView(name: "cloud.sun.rain.fill")
                    
                        Text("\(9)°")
                    }
                }
            }
        }
        .padding(.vertical)
        .background(.black.opacity(0.05))
        .cornerRadius(12)
        
    }
}

struct WeatherHourlyView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHourlyView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
