//
//  HomeViewController.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class HomeViewController: BaseViewController<HomeView> {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
        tabBarItem = UITabBarItem(title: L.main.value, image: UIImage(systemName: "house.fill"), tag: 1)
    }
}
