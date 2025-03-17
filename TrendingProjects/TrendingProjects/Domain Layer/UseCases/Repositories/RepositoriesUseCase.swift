//
//  FetchTrendingRepositoriesUseCase.swift
//  CurrencyConverter
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

private enum FetchTrendingRepositoriesUseCaseConstants {
    static let itemsPerPageLoad: Int = 60
}

protocol FetchTrendingRepositoriesUseCaseProtocol {
    func execute(page: Int) async throws -> Repositories
}

final class FetchTrendingRepositoriesUseCase: FetchTrendingRepositoriesUseCaseProtocol {
    private let repository: RepositoriesRepositoryProtocol
    
    init(repository: RepositoriesRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(page: Int) async throws -> Repositories {
        do {
            return try await repository.getRepositories(
                page: page,
                perPage: FetchTrendingRepositoriesUseCaseConstants.itemsPerPageLoad
            )
        } catch let error as NetworkDataLayerError {
            throw DomainLayerError(dataError: error)
        } catch {
            throw error
        }
    }
}


