//
//  WeatherDailyView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI


struct WeatherDailyView: View {
    
    var body: some View {
        VStack {
            ForEach(0..<3) { item in
                HStack {
                    Text("coucou")
                        .fontWeight(.bold)

                    WeatherIconView(name: "sun.max.fill")
                        .padding(.horizontal)
                    
                    Text("0°")
                        .fontWeight(.bold)
                    
                    Text("12°")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            }
        }
        .background(.black.opacity(0.05))
        .cornerRadius(12)
        .padding()
    }
}

struct WeatherDailyView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDailyView()
            .previewLayout(.sizeThatFits)
    }
}
