//
//  AppCoordinator.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

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
        router.setRoot(ViewController())
    }
}
