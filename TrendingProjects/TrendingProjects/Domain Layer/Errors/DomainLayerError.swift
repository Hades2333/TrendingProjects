//
//  DomainLayerError.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

enum DomainLayerError: Error, LocalizedError {
    case noData
    case parseError
    case generalError

    init(dataError error: NetworkDataLayerError) {
        switch error {
        case .decoding:
            self = .parseError
        default:
            self = .generalError
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return NSLocalizedString("No data available.", comment: "No Data Error")
        case .parseError:
            return NSLocalizedString("Failed to parse data.", comment: "Parse Error")
        case .generalError:
            return NSLocalizedString("An unknown error occurred.", comment: "General Error")
        }
    }
}
