//
//  AppCoordinator.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Navigation
import Inject

final class AppCoordinator: BaseCoordinator {
    @Injected private var coordinatorFactory: CoordinatorFactoryProtocol
    private let router: Routable
    
    init(router: Routable) {
        self.router = router
    }
    
    override func start() {
        runTabBarFlow()
    }
}

// MARK: - Private methods
extension AppCoordinator {
    private func runTabBarFlow() {
        let coordinator = coordinatorFactory.makeTabBarCoordinator(router: router)
        start(coordinator: coordinator)
    }
}
