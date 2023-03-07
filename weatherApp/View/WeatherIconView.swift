//
//  WeatherIconView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI

struct WeatherIconView: View {
    
    var name: String
    
    var body: some View {
        Image(systemName: name)
            .symbolRenderingMode(.multicolor)
            .font(.system(size: 25))
            .padding(5)
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconView(name: "cloud.sun.rain.fill")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
