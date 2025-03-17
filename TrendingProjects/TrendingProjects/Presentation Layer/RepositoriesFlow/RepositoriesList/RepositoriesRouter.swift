//
//  RepositoriesRouter.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

//protocol RepositoriesListRouterProtocol: ObservableObject {
//    func showDetail(repository: Repository)
//}

final class RepositoriesListRouter: ObservableObject {
    @Published var selectedRepository: Repository?
    
    func showDetail(repository: Repository) {
        selectedRepository = repository
    }
}
