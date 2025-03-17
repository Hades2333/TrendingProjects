//
//  TrendingProjectsApp.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI

@main
struct TrendingProjectsApp: App {
    var body: some Scene {
        WindowGroup {
            RepositoriesListBuilder.build()
        }
    }
}
