//
//  Routable.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import Foundation

protocol Routable: HashableByType {
    var navigationType: NavigationType { get }
}
