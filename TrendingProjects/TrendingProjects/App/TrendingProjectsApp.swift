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
    @StateObject private var themeManager = ThemeManager()
    
    private var repositoriesFlow: RepositoriesFlowCoordinator {
        appCoordinator.repositoriesListFlow
    }
    
    var body: some Scene {
        WindowGroup {
            repositoriesFlow.rootView
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.currentTheme)
        }
    }
}
