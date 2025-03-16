//
//  DataNetworkError.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

enum NetworkDataLayerError: Error {
    case emptyResponse
    case decoding(Error)
}
