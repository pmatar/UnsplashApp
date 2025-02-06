//
//  FavoritesView.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class FavoritesView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
}

// MARK: - Private methods
extension FavoritesView {
    private func setupViews() {
        backgroundColor = .blue
    }
}
