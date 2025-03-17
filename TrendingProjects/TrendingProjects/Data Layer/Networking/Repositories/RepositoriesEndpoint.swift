//
//  RepositoriesEndpoint.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

enum RepositoriesEndpoint {
    case getRepositoriesList(page: Int, perPage: Int)
}

extension RepositoriesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getRepositoriesList:
            return "/search/repositories"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var params: [String: Any]? {
        switch self {
        case .getRepositoriesList(let page, let perPage):
            return [
                "q": "swift",
                "sort": "stars",
                "page": "\(page)",
                "per_page": "\(perPage)"
            ]
        }
    }
}
