//
//  DomainLayerError.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

enum DomainLayerError: Error {
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
}
