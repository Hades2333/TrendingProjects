//
//  HTTPDataDownloader.swift
//  CurrencyConverter
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

protocol HTTPDataDownloader {
    func httpData(for request: URLRequest) async throws -> Data
}


extension URLSession: HTTPDataDownloader {
    func httpData(for request: URLRequest) async throws -> Data {
        do {
            let (data, response) = try await self.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                return data
            case 401:
                throw NetworkError.unauthorized
            case 403:
                throw NetworkError.forbidden
            case 404:
                throw NetworkError.notFound
            case 500...599:
                throw NetworkError.serverError
            default:
                throw NetworkError.statusCode(httpResponse.statusCode)
            }
        } catch let error as URLError {
            throw NetworkError.networkError(error)
        } catch {
            throw error
        }
    }
}
