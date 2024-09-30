//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mitchell Gould on 2024-09-25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var weatherData: [[String]] = [["cloud.sun.fill", "TUE", "74"],
                                ["cloud.rain.fill", "WED", "79"],
                                ["cloud.sun.fill", "THU", "80"],
                                ["cloud.sun.rain.fill", "FRI", "90"],
                                ["cloud.bolt.rain.fill", "SAT", "76"]]
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue,
                           bottomColor: Color("lightBlue"),
                           isNight: isNight)
            
            VStack {
                CityTextView(city: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.fill" : "cloud.sun.fill",
                                      temp: 76 )
                
                HStack(spacing: 10 ) {
                    ForEach(weatherData, id: \.self) {dayData in
                        if let temp = Int(dayData[2]) {
                            WeatherDayView(weatherImage: dayData[0],
                                           dayOfWeek: dayData[1],
                                           temp: temp)
                        }
                    }
                }
              
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(buttonText: "Change Day Time",
                                      textColor: .blue,
                                      buttonColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct WeatherDayView:  View {
    
    let weatherImage: String
    let dayOfWeek: String
    let temp: Int
    
    var body: some View {
        
        VStack() {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(10)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}



struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    var isNight: Bool = false
    
    
    var body: some View {
        LinearGradient(colors: isNight ? [Color.black, Color.gray] : [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var city: String

    var body: some View {
        Text(city)
            .font(.system(size: 32,weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size:70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


