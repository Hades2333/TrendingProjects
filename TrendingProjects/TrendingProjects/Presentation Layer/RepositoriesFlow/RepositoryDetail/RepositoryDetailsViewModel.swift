//
//  RepositoryDetailsViewModel.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import Foundation
import Combine

class RepositoryDetailsViewModel: ObservableObject {
    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
}
