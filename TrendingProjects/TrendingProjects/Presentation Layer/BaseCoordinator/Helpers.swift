//
//  Helpers.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import Foundation

protocol IdentifiableByType: Identifiable {}

extension IdentifiableByType {
    var id: String {
        String(describing: self.self)
    }
}

protocol HashableByType: IdentifiableByType, Hashable {}

extension HashableByType {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
