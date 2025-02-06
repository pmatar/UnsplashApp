//
//  HomeView.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class HomeView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
}

// MARK: - Private methods
extension HomeView {
    private func setupViews() {
        backgroundColor = .red
    }
}
