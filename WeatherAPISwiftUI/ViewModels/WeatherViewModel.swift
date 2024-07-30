//
//  WeatherViewModel.swift
//  WeatherAPISwiftUI
//
//  Created by Brian Surface on 7/30/24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject{
    private var weatherService: WeatherService!
    
    @Published var weather = Weather()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = weather.temp{
            return String(format: "%.of", temp)
        }else{
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = weather.humidity{
            return String(format: "%.of", humidity)
        }else{
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String){
        self.weatherService.getWeather(city: city, completion:{ weather in
            if let weather = weather {
                self.weather = weather
            }
        })
    }
}
