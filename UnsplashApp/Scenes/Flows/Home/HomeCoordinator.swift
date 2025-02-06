//
//  HomeCoordinator.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

final class HomeCoordinator: BaseCoordinator {
    @Injected private var moduleFactory: ModuleFactoryProtocol
    private let router: Routable
    
    init(router: Routable) {
        self.router = router
    }
    
    override func start() {
        let (module, _) = moduleFactory.makeHomeModule()

        router.setRoot(module, animated: false)
    }
}
