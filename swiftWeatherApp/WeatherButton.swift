//
//  WeatherButton.swift
//  swiftWeatherApp
//
//  Created by Parth on 29/11/23.
//

import SwiftUI

struct WeatherButtonView: View{
    var title : String
    var backgroundColor : Color
    var foregroundColor : Color
    
    var body: some View {
        Text(title)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.12)
            .background(backgroundColor)
//            .foregroundColor(foregroundColor) 
            .font(.system(size:16, weight: .medium, design: .default))
            .cornerRadius(10)
    }
}

