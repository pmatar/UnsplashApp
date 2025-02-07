//
//  InMemoryFavoritesRepository.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Combine

final class InMemoryFavoritesRepository: FavoritesRepository {
    
    var favorites: AnyPublisher<[Photo], Never> { _favorites.eraseToAnyPublisher() }
    private var _favorites = CurrentValueSubject<[Photo], Never>([])
    
    func addFavorite(_ photo: Photo) {
        var currentFavorites = _favorites.value
        currentFavorites.append(photo)
        _favorites.send(currentFavorites)
    }
    
    func removeFavorite(_ photo: Photo) {
        var currentFavorites = _favorites.value
        currentFavorites.removeAll { $0.id == photo.id }
        _favorites.send(currentFavorites)
    }
    
    func favoritePhotos() -> [Photo] {
        _favorites.value
    }
    
    func isFavorite(_ photo: Photo) -> Bool {
        _favorites.value.contains(where: { $0.id == photo.id })
    }
}
