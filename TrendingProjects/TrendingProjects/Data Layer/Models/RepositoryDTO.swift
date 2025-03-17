//
//  RepositoryDTO.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

struct RepositoryOwnerDTO: Codable {
    let login: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}

struct RepositoryDTO: Codable {
    let id: Int
    let name: String
    let description: String?
    let owner: RepositoryOwnerDTO
    let stargazers_count: Int
    let watchers: Int
    let forks: Int
}

enum RepositoryMapperDTO {

    static func toDomain(dto: RepositoryDTO) -> Repository {
        return Repository(id: dto.id,
                          name: dto.name,
                          description: dto.description,
                          ownerName: dto.owner.login,
                          ownerImageUrl: dto.owner.avatarUrl,
                          stars: dto.stargazers_count,
                          watchers: dto.watchers,
                          forks: dto.forks)
    }
}
