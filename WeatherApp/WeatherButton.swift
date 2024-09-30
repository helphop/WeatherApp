//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Mitchell Gould on 2024-09-30.
//

import SwiftUI


struct WeatherButtonView: View {
    
    var buttonText: String
    var textColor: Color
    var buttonColor: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(buttonColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
