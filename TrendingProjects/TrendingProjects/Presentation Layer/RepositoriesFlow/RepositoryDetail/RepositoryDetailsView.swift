//
//  RepositoryDetailsView.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import SwiftUI

struct RepositoryDetailsView: View {
    let viewModel: RepositoryDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    AsyncImage(url: URL(string: viewModel.repository.ownerImageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.repository.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(viewModel.repository.ownerName)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Text(viewModel.repository.description ?? "No description available")
                    .font(.body)
                    .padding(.top, 8)
                
                HStack {
                    Label("Stars: \(viewModel.repository.stars)", systemImage: "star.fill")
                    Label("Forks: \(viewModel.repository.forks)", systemImage: "tuningfork")
                    Label("Watchers: \(viewModel.repository.watchers)", systemImage: "eye.fill")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle(viewModel.repository.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
