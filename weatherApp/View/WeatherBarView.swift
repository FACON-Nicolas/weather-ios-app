//
//  WeatherBarView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI

struct WeatherBarView: View {
    
    var min: Int
    var begin: Int
    var end: Int
    var max: Int
    
    var body: some View {
        HStack {
            HStack {
                
            }
            .frame(width: (100 / CGFloat((max - min))) * CGFloat((end - begin)), height: 6)
            .background(Color.blue)
            .cornerRadius(3)
            .offset(x: (100 / CGFloat((max - min))) * CGFloat(begin - min))
            
            Spacer()
        }
        .frame(width: 100, height: 6)
        .background(Color.black.opacity(0.2))
        .cornerRadius(3)
    }
}

struct WeatherBarView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherBarView(min: -1, begin: 0, end: 7, max: 9)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
