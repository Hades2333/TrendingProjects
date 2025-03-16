//
//  APIError.swift
//  CurrencyConverter
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case unauthorized
    case forbidden
    case notFound
    case serverError
    case statusCode(Int)
    case networkError(Error)
    case invalidURL
}

