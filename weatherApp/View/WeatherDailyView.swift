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
                    Text("25.")
                        .font(.system(size: 25))
                        .fontWeight(.bold)

                    WeatherIconView(name: "sun.max.fill")
                        .padding(.horizontal)
                    
                    Text("0°")
                        .fontWeight(.bold)
                    
                    WeatherBarView(min: 1, begin: 2, end: 12, max: 14, degree: 4)
                    
                    Text("12°")
                        .fontWeight(.bold)
                    
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
