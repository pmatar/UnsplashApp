//
//  FavoritesRepository.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Combine

protocol FavoritesRepository {
    var favorites: AnyPublisher<[Photo], Never> { get }
    
    func addFavorite(_ photo: Photo)
    func removeFavorite(_ photo: Photo)
    func favoritePhotos() -> [Photo]
    func isFavorite(_ photo: Photo) -> Bool
}
