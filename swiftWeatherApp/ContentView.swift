//
//  ContentView.swift
//  swiftWeatherApp
//
//  Created by Parth on 29/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            LinearGradientView(isNight: $isNight)
            //            LinearGradientView(topColor: .black, bottomColor: .gray)
            VStack(spacing:0){
                MainCardView(cityName: "Mumbai, IND",
                             imageName: isNight ? "moon.stars.fill": "cloud.sun.fill",
                             temperature: 32)
                
                
                HStack(spacing: UIScreen.main.bounds.width * 0.08){
                    WeatherDayView(dayName: "TUE", systemName: "cloud.sun.fill", temperature: 32)
                    WeatherDayView(dayName: "WED", systemName: "sun.max.fill", temperature: 28)
                    WeatherDayView(dayName: "THU", systemName: "wind.snow", temperature: 30)
                    WeatherDayView(dayName: "FRI", systemName: "cloud.sun.bolt.fill", temperature: 28)
                    WeatherDayView(dayName: "SAT", systemName: "cloud.sun.rain.fill", temperature: 31)
                }
                Spacer()
                
                Button{
                    isNight = !isNight
                } label: {
                    WeatherButtonView(title: "Change Day Time",
                                      backgroundColor: Color(.white),
                                      foregroundColor: Color(.blue))
                }
                Spacer()
            }
        }
    }
}



struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayName : String
    var systemName : String
    var temperature : Int
    var body: some View {
        VStack{
            Text(dayName)
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(.white)
            VStack{
                Image(systemName: systemName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
        }
    }
}

struct LinearGradientView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct MainCardView: View {
    var cityName : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .bold, design: .default))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, UIScreen.main.bounds.height*0.15)
    }
}


