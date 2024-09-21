//
//  GeocodingClient.swift
//  WeatherAPISwiftUI
//
//  Created by Brian Surface on 9/21/24.
//

import Foundation

enum NetworkError:Error {
    case invalidResponse
}

struct GeocodingClient {
    
    func coordinateByCity(_ city: String) async throws -> Location?{
        
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .coordinatesByLocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
              }
        let location = try JSONDecoder().decode([Location].self, from: data)
        return location.first
    }
}
