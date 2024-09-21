//
//  ContentView.swift
//  WeatherAPISwiftUI
//
//  Created by Brian Surface on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var city:String = ""
    @State private var isFetchingWeather: Bool = false
    @State private var weather: Weather?
    
    let geocoder = GeocodingClient()
    let weatherClient = WeatherClient()
    
    private func fetchWeather() async {
        do{
            guard let location = try await geocoder.coordinateByCity(city) else {return}
            weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack{
            TextField("Enter city name", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    await fetchWeather()
                    isFetchingWeather = false
                    city = ""
                }
            Spacer()
            if let weather = weather {
                Text(MeasurementFormatter.temperature(value: weather.temp!))
                    .font(.system(size: 100))
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
