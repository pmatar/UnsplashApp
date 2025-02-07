//
//  RemotePhotosRepository.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Network
import Inject

actor RemotePhotosRepository: PhotosRepository {
    @Injected private var httpClient: HTTPClient
    @Injected private var httpMapper: HTTPResponseMapper
}

// MARK: - Public methods
extension RemotePhotosRepository {
    func fetchPhotos(page: Int) async throws -> [Photo] {
        let photosDTOs = try await getPhotos(page: page)
        return photosDTOs.map(Photo.init)
    }
    
    func searchPhotos(query: String, page: Int) async throws -> [Photo] {
        let photosDTOs = try await getPhotos(query: query, page: page)
        return photosDTOs.map(Photo.init)
    }
}

// MARK: - Private methods
extension RemotePhotosRepository {
    private func getPhotos(page: Int, perPage: Int = 20) async throws -> [PhotoDTO] {
        let request = try PhotosEndpoint.listPhotos(page: page, perPage: perPage).request()
        let response = try await httpClient.send(request: request)
        return try httpMapper.map(data: response.0, response: response.1)
    }
    
    private func getPhotos(query: String, page: Int, perPage: Int = 20) async throws -> [PhotoDTO] {
        let request = try PhotosEndpoint.searchPhotos(query: query, page: page, perPage: perPage).request()
        let response = try await httpClient.send(request: request)
        return try httpMapper.map(data: response.0, response: response.1)
    }
}
