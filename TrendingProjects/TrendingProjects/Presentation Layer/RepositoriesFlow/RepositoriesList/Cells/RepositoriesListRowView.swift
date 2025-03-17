//
//  RepositoriesListRowView.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI

struct RepositoryRowView: View {
    let viewModel: RepositoryCellViewModel
    
    init(repository: Repository) {
        self.viewModel = RepositoryCellViewModel(repository: repository)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.headline)
                HStack {
                    Text(viewModel.stars)
                    Text(viewModel.forks)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
    }
}
