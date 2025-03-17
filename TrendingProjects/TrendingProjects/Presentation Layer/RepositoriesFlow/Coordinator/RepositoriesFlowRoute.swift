//
//  RepositoriesFlowRoute.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import Foundation

enum RepositoriesFlowRoute: Routable {
    
    case pushed
    case sheeted
    case repositoryDetails(Repository)

    var navigationType: NavigationType {
        switch self {
            case .repositoryDetails, .pushed:
                return .push
            case .sheeted:
                return .present(.sheet([.medium, .large]))
        }
    }
}
