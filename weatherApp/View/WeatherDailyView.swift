//
//  WeatherDailyView.swift
//  weatherApp
//
//  Created by Nicolas FACON on 04/03/2023.
//

import SwiftUI


struct WeatherDailyView: View {
    
    let week: WeatherWeek
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Weather Day by day".uppercased())
                            .font(.system(size: 13))

                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .padding(.top, 8)
                    .foregroundColor(.white.opacity(0.5))
                }
                ForEach(week.days) { day in
                    Divider().padding(.horizontal, 10).padding(.bottom, 5)
                    HStack {
                        Text("\(day.day).")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .frame(width: 60)
                            .padding(3)

                        Spacer()
                        
                        WeatherIconView(name: day.weather())
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Text("\(day.minTemp)°")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        WeatherBarView(min: Int(week.min), begin: day.minTemp, end: day.maxTemp, max: Int(week.max), degree: (week.days.firstIndex(of: day) == 0 ? week.degrees! : Double.infinity))
                        
                        Spacer()
                        
                        Text("\(day.maxTemp)°")
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, week.days.firstIndex(of: day) == week.days.count - 1 ? 15 : 0)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .background(.black.opacity(0.05))
        .cornerRadius(12)
        .padding()
    }
}

struct WeatherDailyView_Previews: PreviewProvider {
    static var week = WeatherWeek(days: [
        WeatherDaily(minTemp: 3, maxTemp: 9, day: "Mon"),
        WeatherDaily(minTemp: 2, maxTemp: 11, day: "Tue"),
        WeatherDaily(minTemp: 5, maxTemp: 8, day: "Wed"),
    ], min: 2, max: 11, degrees: 4)
    static var previews: some View {
        WeatherDailyView(week: week)
            .previewLayout(.sizeThatFits)
    }
}
