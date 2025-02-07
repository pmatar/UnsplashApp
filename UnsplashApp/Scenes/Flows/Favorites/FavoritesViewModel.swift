//
//  FavoritesViewModel.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Inject
import Combine

final class FavoritesViewModel: FavoritesOutput {
    var onSelect: Closure<Photo>?
    var favorites: AnyPublisher<[Photo], Never> {
        favoritesRepository.favorites
    }
    
    @Injected private var favoritesRepository: FavoritesRepository
}
