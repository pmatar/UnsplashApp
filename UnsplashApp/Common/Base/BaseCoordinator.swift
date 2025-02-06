//
//  BaseCoordinator.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

class BaseCoordinator: Coordinator {
    
    var didFinish: EmptyClosure?
    var childCoordinators = [Coordinator]()
    
    func start() {
        preconditionFailure("Has to be overridden")
    }
    
    func start(coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        
        childCoordinators.append(coordinator)
        if coordinator.didFinish == nil {
            coordinator.didFinish = { [weak self, weak coordinator] in
                guard let coordinator else { return }
                self?.finish(coordinator: coordinator)
            }
        }
        coordinator.start()
    }
    
    func finish(coordinator: Coordinator) {
        guard !childCoordinators.isEmpty else { return }
        
        if let baseCoordinator = coordinator as? BaseCoordinator, !baseCoordinator.childCoordinators.isEmpty {
            for childCoordinator in baseCoordinator.childCoordinators where childCoordinator !== baseCoordinator {
                baseCoordinator.finish(coordinator: childCoordinator)
            }
        }
        
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
