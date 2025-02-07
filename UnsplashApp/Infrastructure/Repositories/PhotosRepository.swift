//
//  PhotosRepository.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation

protocol PhotosRepository {
    func fetchPhotos(page: Int) async throws -> [Photo]
    func searchPhotos(query: String, page: Int) async throws -> [Photo]
}
