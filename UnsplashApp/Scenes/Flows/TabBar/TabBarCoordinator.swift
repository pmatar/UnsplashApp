//
//  TabBarCoordinator.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

final class TabBarCoordinator: BaseCoordinator {
    @Injected private var coordinatorFactory: CoordinatorFactoryProtocol
    @Injected private var moduleFactory: ModuleFactoryProtocol
    
    private let router: Routable
    
    init(router: Routable) {
        self.router = router
    }
    
    override func start() {
        let homeTab = runHomeFlow()
        let favoritesTab = runFavoritesFlow()

        let module = moduleFactory.makeTabBarModule([homeTab, favoritesTab])
        router.setRoot(module, animated: false, hideNavigationBar: true)
    }
}

// MARK: - Private methods
extension TabBarCoordinator {
    private func runHomeFlow() -> any Presentable {
        let (coordinator, presenter) = coordinatorFactory.makeHomeCoordinatorBox()
        start(coordinator: coordinator)
        return presenter
    }
    
    private func runFavoritesFlow()-> any Presentable {
        let (coordinator, presenter) = coordinatorFactory.makeFavoritesCoordinatorBox()
        start(coordinator: coordinator)
        return presenter
    }
}
