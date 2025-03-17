//
//  RequestBuilder.swift
//  CurrencyConverter
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

class RequestBuilder {
    
    func makeRequest(from endpoint: Endpoint, with host: String) throws -> URLRequest {
        let url = try makeUrl(from: endpoint, with: host)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        return request
    }
    
    private func makeUrl(from endpoint: Endpoint, with host: String) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = endpoint.path
        
        if let params = endpoint.params {
            components.queryItems = params.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        return url
    }
}
