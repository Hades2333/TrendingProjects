//
//  RepositoryDetailsRouter.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import SwiftUI

class RepositoryDetailsRouter: ObservableObject {
    @Published var selectedRepository: Repository?
    
    func showDetail(repository: Repository) {
        selectedRepository = repository
    }
}
