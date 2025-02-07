//
//  ModuleFactory.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Navigation

// MARK: - Protocol
protocol ModuleFactoryProtocol {
    func makeTabBarModule(_ tabs: [any Presentable]) -> any Presentable
    func makeHomeModule() -> Module<HomeOutput>
    func makeFavoritesModule() -> Module<FavoritesOutput>
    func makeDetailsModule(photo: Photo) -> Module<DetailsOutput>
}

// MARK: - Implementation
struct ModuleFactory: ModuleFactoryProtocol {
    func makeTabBarModule(_ tabs: [any Presentable]) -> any Presentable {
        let tabBarController = TabBarViewController()
        let vcs = tabs.map { $0.toPresentable() }
        tabBarController.setViewControllers(vcs, animated: false)
        return tabBarController
    }
    
    func makeHomeModule() -> Module<HomeOutput> {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        return (viewController, viewModel)
    }
    
    func makeFavoritesModule() -> Module<FavoritesOutput> {
        let viewModel = FavoritesViewModel()
        let viewController = FavoritesViewController(viewModel: viewModel)
        return (viewController, viewModel)
    }
    
    func makeDetailsModule(photo: Photo) -> Module<DetailsOutput> {
        let viewModel = DetailsViewModel(photo: photo)
        let viewController = DetailsViewController(viewModel: viewModel)
        return (viewController, viewModel)
    }
}
