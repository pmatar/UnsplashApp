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
    func makeHomeModule() -> Module
    func makeFavoritesModule() -> Module
}

// MARK: - Implementation
struct ModuleFactory: ModuleFactoryProtocol {
    func makeTabBarModule(_ tabs: [any Presentable]) -> any Presentable {
        let tabBarController = TabBarViewController()
        let vcs = tabs.map { $0.toPresentable() }
        tabBarController.setViewControllers(vcs, animated: false)
        return tabBarController
    }
    
    func makeHomeModule() -> Module {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        return (viewController, viewModel)
    }
    
    func makeFavoritesModule() -> Module {
        let viewModel = FavoritesViewModel()
        let viewController = FavoritesViewController(viewModel: viewModel)
        return (viewController, viewModel)
    }
}
