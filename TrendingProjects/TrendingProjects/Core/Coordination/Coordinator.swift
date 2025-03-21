//
//  Coordinator.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import SwiftUI

protocol Coordinator: ObservableObject, CoordinatorFinishDelegate {
    
    associatedtype Content: View
    
    @MainActor @ViewBuilder var rootView: Content { get }
    
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func finish()
}

extension Coordinator {
    
    func finish() {
        finishDelegate?.didFinish(childCoordinator: self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func didFinish(childCoordinator: any Coordinator)
}
