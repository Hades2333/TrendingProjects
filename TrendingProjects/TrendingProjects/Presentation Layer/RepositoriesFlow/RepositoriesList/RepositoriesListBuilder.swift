//
//  RepositoriesListBuilder.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI

final class RepositoriesListBuilder {
    static func build() -> some View {
        let client = HTTPClient()
        let repository = RepositoriesRepository(client: client)
        let useCase = FetchTrendingRepositoriesUseCase(repository: repository)
        let viewModel = RepositoriesListViewModel(fetchTrendingRepositoriesUseCase: useCase)
        
        return RepositoriesView(viewModel: viewModel)
    }
}
