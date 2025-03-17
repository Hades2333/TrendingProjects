//
//  TrendingProjectsApp.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI

@main
struct TrendingProjectsApp: App {
    @StateObject var appCoordinator = AppCoordinator()
    
    private var repositoriesFlow: RepositoriesFlowCoordinator {
        appCoordinator.repositoriesListFlow
    }
    
    var body: some Scene {
        WindowGroup {
            repositoriesFlow.rootView
        }
    }
}
