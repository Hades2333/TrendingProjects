//
//  RepositoriesListView.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI
import Combine

struct RepositoriesView: View {
    @StateObject var viewModel: RepositoriesListViewModel
    @EnvironmentObject var coordinator: RepositoriesFlowCoordinator
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        content
            .navigationTitle("Trending Repositories")
            .onAppear {
                viewModel.requestInitialSetOfItems()
            }
            .onChange(of: viewModel.repositories) { _, newRepos in
                if viewModel.selectedRepository == nil, let firstRepo = newRepos.first {
                    DispatchQueue.main.async {
                        viewModel.selectedRepository = firstRepo
                    }
                }
            }
        Button(action: {
            themeManager.toggleTheme()
        }) {
            Text("Toggle Theme")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

    @ViewBuilder
    private var content: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            NavigationSplitView {
                repositoryList
            } detail: {
                if let repo = viewModel.selectedRepository {
                    RepositoryDetailsBuilder.build(repository: repo)
                } else {
                    VStack {
                        Text("Select a repository")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                    }
                }
            }
        } else {
            repositoryList
        }
    }

    private var repositoryList: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                List(viewModel.repositories, id: \.id) { repo in
                    RepositoryRowView(repository: repo)
                        .environmentObject(themeManager)
                        .onTapGesture {
                            if UIDevice.current.userInterfaceIdiom == .pad {
                                viewModel.selectedRepository = repo
                            } else {
                                coordinator.pushRepositoryDetails(repository: repo)
                            }
                        }
                        .onAppear {
                            viewModel.requestMoreItemsIfNeeded(repository: repo)
                        }
                }
                .overlay {
                    if viewModel.isLoading {
                        SpinnerView()
                    }
                }
            }
        }
    }
}
