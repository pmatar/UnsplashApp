//
//  FavoritesCoordinator.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Navigation
import Inject

final class FavoritesCoordinator: BaseCoordinator {
    @Injected private var moduleFactory: ModuleFactoryProtocol
    private let router: Routable
    
    init(router: Routable) {
        self.router = router
    }
    
    override func start() {
        let (module, output) = moduleFactory.makeFavoritesModule()
        output.onSelect = { [weak self] photo in
            self?.showDetails(for: photo)
        }
        router.setRoot(module, animated: false)
    }
}

// MARK: - Private methods
extension FavoritesCoordinator {
    private func showDetails(for photo: Photo) {
        let (module, output) = moduleFactory.makeDetailsModule(photo: photo)
        output.onDismiss = { [weak self] in
            self?.router.dismiss()
        }
        router.present(module)
    }
}
