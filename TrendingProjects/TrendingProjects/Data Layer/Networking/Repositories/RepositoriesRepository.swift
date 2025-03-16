//
//  RepositoriesRepository.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

protocol RepositoriesRepositoryProtocol {
    func getRepositories() async throws -> [Repository]
}

class RepositoriesRepository {
    private let client: HTTPClient
    private let host: String
    private let decoder: JSONDecoder
    
    init(client: HTTPClient,
         host: String = NetworkConstants.host,
         decoder: JSONDecoder = JSONDecoder()) {
        self.client = client
        self.host = host
        self.decoder = decoder
    }
    
    func getRepositories() async throws -> RepositoriesDTO {
        do {
            let data = try await client.data(from: RepositoriesEndpoint.getRepositoriesList, with: host)
            return try decoder.decode(RepositoriesDTO.self, from: data)
        }
    }
    
    func getRepositories() async throws -> [Repository] {
        do {
            let data = try await client.data(from: RepositoriesEndpoint.getRepositoriesList, with: host)
            let dto = try decoder.decode([RepositoryDTO].self, from: data)
            
            if dto.isEmpty {
                throw NetworkDataLayerError.emptyResponse
            }
            
            return dto.map { RepositoryMapperDTO.toDomain(dto: $0) }
        } catch let error as DecodingError {
            throw NetworkDataLayerError.decoding(error)
        } catch {
            throw error
        }
    }
}

