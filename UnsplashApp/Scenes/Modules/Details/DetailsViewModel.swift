//
//  DetailsViewModel.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation
import Inject

final class DetailsViewModel: DetailsOutput {
    var onDismiss: EmptyClosure?
    
    private(set) var photo: Photo
    
    @Injected private var favoritesRepository: FavoritesRepository
    
    init(photo: Photo) {
        self.photo = photo
    }
}

// MARK: - Public methods
extension DetailsViewModel {
    func toggleFavorite(_ selected: Bool) {
        if selected {
            favoritesRepository.removeFavorite(photo)
        } else {
            favoritesRepository.addFavorite(photo)
        }
    }
    
    func isFavorite() -> Bool {
        favoritesRepository.isFavorite(photo)
    }
}
