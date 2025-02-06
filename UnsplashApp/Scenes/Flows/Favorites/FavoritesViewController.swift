//
//  FavoritesViewController.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class FavoritesViewController: BaseViewController<FavoritesView> {
    private let viewModel: FavoritesViewModel
    
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        super.init()
        tabBarItem = UITabBarItem(title: L.favorites.value, image: UIImage(systemName: "heart.fill"), tag: 1)
    }
}
