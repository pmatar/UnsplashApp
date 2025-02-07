//
//  DetailsViewController.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import UIKit

final class DetailsViewController: BaseViewController<DetailsView> {
    private let viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        customView.configure(with: viewModel.photo, isSelected: viewModel.isFavorite())
    }
}

// MARK: - Private methods
extension DetailsViewController {
    private func setupActions() {
        customView.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func likeButtonTapped() {
        viewModel.toggleFavorite(customView.likeButton.isSelected)
        customView.likeButton.isSelected.toggle()
    }
}
