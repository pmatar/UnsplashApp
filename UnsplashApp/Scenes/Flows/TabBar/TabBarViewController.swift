//
//  TabBarViewController.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
}

// MARK: Private functions
extension TabBarViewController {
    private func configureTabBar() {
        let appearance = UITabBarAppearance()

        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.systemTeal
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.label]

        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}
