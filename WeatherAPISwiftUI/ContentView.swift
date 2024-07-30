//
//  ContentView.swift
//  WeatherAPISwiftUI
//
//  Created by Brian Surface on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    var body: some View {
        VStack( alignment: .center){
            
            TextField("Enter city name", text: self.$weatherVM.cityName){
                self.weatherVM.search()
            }.font(.largeTitle)
                .padding()
                .fixedSize()
            
            Text(self.weatherVM.temperature)
                .font(.custom("Arial", size: 100))
                .foregroundColor(.white)
                .offset(y: 100)
                .padding()
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.green)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
