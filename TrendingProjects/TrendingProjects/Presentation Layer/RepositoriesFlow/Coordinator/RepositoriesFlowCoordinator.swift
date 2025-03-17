//
//  RepositoriesRouter.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI

final class RepositoriesFlowCoordinator: FlowCoordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    @Published var childCoordinator: (any Coordinator)?
    @Published var navigationControllers = [NavigationController<RepositoriesFlowRoute>]()
    
    init() {
        setupInitialNavigationController()
    }
    
    func destination(for route: RepositoriesFlowRoute) -> some View {
        switch route {
        case .pushed:
            RepositoriesListBuilder.build()
        case .sheeted:
            RepositoriesListBuilder.build()
        case .repositoryDetails(let repo):
            RepositoryDetailsBuilder.build(repository: repo)
        }
    }
    
    var rootView: some View {
        NavigatingView(
            nc: self.rootNavigationController,
            coordinator: self
        ) {
            RepositoriesListBuilder.build()
                .environmentObject(self)
        }
    }
    
    func pushNextScreen() {
        push(route: .pushed)
    }
    
    func presentNextScreen() {
        present(route: .sheeted)
    }
    
    func pushRepositoryDetails(repository: Repository) {
        push(route: .repositoryDetails(repository))
    }
    
    deinit {
        print("Deinit RepositoriesFlow")
    }
}
