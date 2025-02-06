//
//  CoordinatorFactory.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

// MARK: - Protocol
protocol CoordinatorFactoryProtocol {
    func makeTabBarCoordinator(router: any Routable) -> any Coordinator
    func makeHomeCoordinatorBox() -> CoordinatorBox
    func makeFavoritesCoordinatorBox() -> CoordinatorBox
}

struct CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeTabBarCoordinator(router: any Routable) -> any Coordinator {
        let coordinator = TabBarCoordinator(router: router)
        return coordinator
    }
    
    func makeHomeCoordinatorBox() -> CoordinatorBox {
        let navigationController = BaseNavigationController()
        let router = Router(navigationController: navigationController)
        let coordinator = HomeCoordinator(router: router)
        return (coordinator, navigationController)
    }
    
    func makeFavoritesCoordinatorBox() -> CoordinatorBox {
        let navigationController = BaseNavigationController()
        let router = Router(navigationController: navigationController)
        let coordinator = FavoritesCoordinator(router: router)
        return (coordinator, navigationController)
    }
}
