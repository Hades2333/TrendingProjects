//
//  RepositoryDetailsBuilder.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import SwiftUI

struct RepositoryDetailsBuilder {
    static func build(repository: Repository) -> RepositoryDetailsView {
        let viewModel = RepositoryDetailsViewModel(repository: repository)
        return RepositoryDetailsView(viewModel: viewModel)
    }
}
