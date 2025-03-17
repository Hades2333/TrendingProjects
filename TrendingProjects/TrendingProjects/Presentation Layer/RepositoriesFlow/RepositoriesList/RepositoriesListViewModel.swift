//
//  RepositoriesListViewModel.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI
import Combine

class RepositoriesListViewModel: ObservableObject {
    private let fetchTrendingRepositoriesUseCase: FetchTrendingRepositoriesUseCaseProtocol
    
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    var totalAmount: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    private let itemsFromEndThreshold = 15
    private var totalItemsAvailable: Int?
    private var itemsLoadedCount: Int?
    private var page = 1
    
    // MARK: - Initialization
    
    init(fetchTrendingRepositoriesUseCase: FetchTrendingRepositoriesUseCaseProtocol) {
        self.fetchTrendingRepositoriesUseCase = fetchTrendingRepositoriesUseCase
    }
    
    // MARK: - Methods
    
    func requestInitialSetOfItems() {
        page = 1
        requestItems(page: page)
    }
        
    func requestMoreItemsIfNeeded(repository: Repository) {
        guard !repositories.isEmpty,
              !isLoading,
              let itemsLoadedCount = itemsLoadedCount,
              let totalItemsAvailable = totalItemsAvailable,
              let index = repositories.firstIndex(where: { $0.id == repository.id }) else {
            return
        }
        
        if index >= (itemsLoadedCount - itemsFromEndThreshold) && itemsLoadedCount < totalItemsAvailable {
            page += 1
            errorMessage = nil
            requestItems(page: page)
        }
    }
        
    private func requestItems(page: Int) {
        isLoading = true
        Task {
            do {
                let response = try await fetchTrendingRepositoriesUseCase.execute(page: page)
                totalItemsAvailable = response.totalCount
                
                await MainActor.run {
                    self.repositories.append(contentsOf: response.items)
                    self.itemsLoadedCount = repositories.count
                    self.isLoading = false
                }
            } catch let error {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
        
    private func moreItemsRemaining(_ itemsLoadedCount: Int, _ totalItemsAvailable: Int) -> Bool {
        return itemsLoadedCount < totalItemsAvailable
    }
}
