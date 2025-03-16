//
//  RepositoriesEndpoint.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

enum RepositoriesEndpoint {
    case getRepositoriesList
}

extension RepositoriesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getRepositoriesList:
            return "repositories?q=swift&sort=stars"
        }
    }

    var method: HTTPMethod {
        .get
    }

    var params: [String: Any]? {
        return nil
    }
}
