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
    @StateObject var router: RepositoriesListRouter
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.repositories, id: \.id) { repo in
                        RepositoryRowView(repository: repo)
                            .onAppear {
                                viewModel.requestMoreItemsIfNeeded(repository: repo)
                            }
                            .onTapGesture {
                                print("hi")
                            }
                    }
                    .overlay {
                        if viewModel.isLoading {
                            SpinnerView()
                        }
                    }
                }
                
            }
            .navigationTitle("Trending Repositories")
            .onAppear {
                viewModel.requestInitialSetOfItems()
            }
//            .sheet(item: $router.selectedRepository) { repository in
//                print(repository)
//                // calling detailes repository
////                RepositoryDetailView(repository: repository)
//            }
        }
    }
}

#Preview {
    RepositoriesListBuilder.build()
}
