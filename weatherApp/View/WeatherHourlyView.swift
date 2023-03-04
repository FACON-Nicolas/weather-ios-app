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
                        
                        Image(systemName: "cloud.sun.rain.fill")
                            .shadow(radius: 3)
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 25))
                            .padding()
                        
                        Text("\(9)°")
                    }
                }
            }
        }
        .padding(.vertical)
        .background(.black.opacity(0.1))
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
