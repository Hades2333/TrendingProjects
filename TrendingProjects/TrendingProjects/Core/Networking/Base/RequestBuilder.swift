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
        request.httpBody = makeBody(from: endpoint.params)
        return request
    }

    private func makeBody(from params: [String: Any]?) -> Data? {
        guard let params, !params.isEmpty else {
            return nil
        }
        return try? JSONSerialization.data(withJSONObject: params)
    }

    private func makeUrl(from endpoint: Endpoint, with host: String) throws -> URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = host
        components.path = endpoint.path
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        return url
    }
}
