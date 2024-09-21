//
//  APIEndpoint.swift
//  WeatherAPISwiftUI
//
//  Created by Brian Surface on 9/21/24.
//

import Foundation

enum APIEndpoint{
    
    static let baseUrl = "https://api.openweathermap.org"
    
    case coordinatesByLocationName(String)
    case weatherByLatLon(Double, Double)
    
    private var path: String {
        
        switch self{
        case .coordinatesByLocationName(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.weatherAPIKey)"
        case .weatherByLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.Keys.weatherAPIKey)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoint)-> URL {
        let endpointPath = endpoint.path
        return URL(string: baseUrl + endpointPath)!
    }
}
