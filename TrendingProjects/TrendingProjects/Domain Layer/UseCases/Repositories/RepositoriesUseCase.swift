//
//  FetchTrendingRepositoriesUseCase.swift
//  CurrencyConverter
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

protocol FetchTrendingRepositoriesUseCaseProtocol {
    func execute() async throws -> [Repository]
}

final class FetchTrendingRepositoriesUseCase: FetchTrendingRepositoriesUseCaseProtocol {
    private let repository: RepositoriesRepositoryProtocol
    
    init(repository: RepositoriesRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Repository] {
        do {
            return try await repository.getRepositories()
        } catch let error as NetworkDataLayerError {
            throw DomainLayerError(dataError: error)
        } catch {
            throw error
        }
    }
}


