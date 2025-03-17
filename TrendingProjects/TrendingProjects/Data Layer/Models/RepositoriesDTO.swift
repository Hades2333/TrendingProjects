//
//  RepositoriesDTO.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

struct RepositoriesDTO: Codable {
    let totalCount: Int
    let items: [RepositoryDTO]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

enum RepositoriesMapperDTO {

    static func toDomain(dto: RepositoriesDTO) -> Repositories {
        return Repositories(totalCount: dto.totalCount,
                            items: dto.items.map { RepositoryMapperDTO.toDomain(dto: $0) })
    }
}
