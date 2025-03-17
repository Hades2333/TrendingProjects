//
//  APIError.swift
//  CurrencyConverter
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidResponse
    case unauthorized
    case forbidden
    case notFound
    case serverError
    case statusCode(Int)
    case networkError(Error)
    case invalidURL
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return NSLocalizedString("Invalid response from server.", comment: "Invalid Response Error")
        case .unauthorized:
            return NSLocalizedString("Unauthorized access. Please check your credentials.", comment: "Unauthorized Error")
        case .forbidden:
            return NSLocalizedString("Access to this resource is forbidden.", comment: "Forbidden Error")
        case .notFound:
            return NSLocalizedString("Requested resource was not found.", comment: "Not Found Error")
        case .serverError:
            return NSLocalizedString("Internal server error. Please try again later.", comment: "Server Error")
        case .statusCode(let code):
            return String(format: NSLocalizedString("Unexpected status code: %d", comment: "Status Code Error"), code)
        case .networkError(let error):
            return String(format: NSLocalizedString("Network error occurred: %@", comment: "Network Error"), error.localizedDescription)
        case .invalidURL:
            return NSLocalizedString("Invalid URL. Please check your request.", comment: "Invalid URL Error")
        }
    }
}

