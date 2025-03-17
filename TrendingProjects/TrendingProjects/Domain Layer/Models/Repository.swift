//
//  Repository.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

struct Repository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let ownerName: String
    let ownerImageUrl: String
    let stars: Int
    let watchers: Int
    let forks: Int
}
