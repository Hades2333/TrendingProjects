//
//  RepositoriesRepository.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

protocol RepositoriesRepositoryProtocol {
    func getRepositories(page: Int, perPage: Int) async throws -> Repositories
}

class RepositoriesRepository: RepositoriesRepositoryProtocol {
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
    
    func getRepositories(page: Int, perPage: Int) async throws -> Repositories {
        do {
            let data = try await client.data(from: RepositoriesEndpoint.getRepositoriesList(page: page, perPage: perPage), with: host)
            let dto = try decoder.decode(RepositoriesDTO.self, from: data)
            
            if dto.items.isEmpty {
                throw NetworkDataLayerError.emptyResponse
            }
            
            return RepositoriesMapperDTO.toDomain(dto: dto)
        } catch let error as DecodingError {
            throw NetworkDataLayerError.decoding(error)
        } catch {
            throw error
        }
    }
}

