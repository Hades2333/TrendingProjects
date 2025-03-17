//
//  RepositoriesListCellViewModel.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

struct RepositoryCellViewModel: Identifiable {
    let id: Int
    let name: String
    let stars: String
    let forks: String
    
    init(repository: Repository) {
        self.name = "\(repository.ownerName)/\(repository.name)"
        self.stars = "⭐ \(repository.stars)"
        self.forks = "🍴 \(repository.forks)"
        self.id = repository.id
    }
}
