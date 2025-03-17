//
//  CompositionCoordinator.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import Foundation

protocol CompositionCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] { get set }
}

extension CompositionCoordinator {
    
    func didFinish(childCoordinator: any Coordinator) {
        childCoordinators.removeAll { $0 === childCoordinator }
    }
}
