//
//  ContentView.swift
//  weatherapp1
//
//  Created by Matti Ullah on 24/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight=false
    var body: some View {
        ZStack{
            BacGroundView(topClr: isNight ?.gray :.blue, midlClr: .black, botomClr:isNight ?.gray: .purple)
            VStack{
                CityTextView(CityName: " Jampur, Pak ")
                MainWeatherstatus(img: isNight ?"moon.stars.fill":"cloud.sun.fill", temp: 47)
                Spacer()
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 40)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temp: 25)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.rain.fill", temp: 20)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temp: 30)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temp: 40)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "sun.max.fill", temp: 48)
                }
                Spacer()
                Button {
                    isNight.toggle()
                    
                } label:{
                    WeatherButton(title: isNight ? "Day Time":"Night Time", textcolor: isNight ?.black:.white, bgcolor: isNight ? .white:.purple).bold()
                }
                Spacer()
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct WeatherDayView: View {
        
        var dayOfWeek:String
        var imageName:String
        var temp:Int
        var body: some View {
            VStack{
                Text(dayOfWeek)
                    .font(.system(size:20,weight:.medium,design: .default))
                    .foregroundColor(.white)
                
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width:40,height: 40)
                Text("\(temp)°")
                    .font(.system(size:28 ,weight:.medium))
                    .foregroundColor(.white)
            }
        }
    }
}

struct BacGroundView: View {
    
        var topClr : Color
        var midlClr:Color
        var botomClr:  Color
    var body: some View {
        LinearGradient(gradient:    Gradient(colors:[topClr,midlClr,botomClr]), startPoint: .topLeading,
                       endPoint: .bottomTrailing )
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var CityName:String
    var body: some View {
        Text(CityName)
            .font(.system(size:42,weight:.medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherstatus: View {
    var img:String
    var temp:Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: img)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width:180,height: 180)
            
            Text("\(temp)°")
                .font(.system(size:70,weight:.medium))
                .foregroundColor(.white)
        }
    }
}
