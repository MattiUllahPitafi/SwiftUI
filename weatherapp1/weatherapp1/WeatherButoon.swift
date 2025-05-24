//
//  WeatherButoon.swift
//  weatherapp1
//
//  Created by Matti Ullah on 24/05/2025.
//

import SwiftUI
struct WeatherButton: View{
    var title:String
    var textcolor:Color
    var bgcolor:Color
    var body: some View{
        Text(title)
            .frame(width: 200,height: 50)
            .foregroundColor(textcolor)//by default white
            .background(bgcolor)//purple
            .font(.system(size:20,weight:.bold,design: .default))
            .cornerRadius(10)
    }
}
