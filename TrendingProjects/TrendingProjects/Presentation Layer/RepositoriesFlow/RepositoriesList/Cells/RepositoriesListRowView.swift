//
//  RepositoriesListRowView.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI

struct RepositoryRowView: View {
    let viewModel: RepositoryCellViewModel
    @EnvironmentObject var themeManager: ThemeManager
    
    init(repository: Repository) {
        self.viewModel = RepositoryCellViewModel(repository: repository)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.headline)
                    .foregroundColor(themeManager.textColor())
                
                HStack {
                    Text(viewModel.stars)
                    Text(viewModel.forks)
                }
                .font(.subheadline)
                .foregroundColor(themeManager.textColor().opacity(0.7))
            }
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(themeManager.backgroundColor()).shadow(radius: 3))
    }
}
