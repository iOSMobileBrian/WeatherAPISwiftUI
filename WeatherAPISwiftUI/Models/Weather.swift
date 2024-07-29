//
//  Weather.swift
//  WeatherAPISwiftUI
//
//  Created by Brian Surface on 7/29/24.
//

import Foundation


struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable{
    
    var temp: Double?
    var humidity: Double?
    
    
}
