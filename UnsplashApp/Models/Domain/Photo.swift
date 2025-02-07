//
//  Photo.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation

struct Photo: Hashable {
    let id: String
    let location: String?
    let createdAt: Date?
    let author: String
    let description: String?
    let thumbnailUrl: String
    let regularUrl: String
    let fullUrl: String
}

// MARK: - DTO initializer
extension Photo {
    init(dto: PhotoDTO) {
        self.id = dto.id
        self.location = dto.user.location
        self.createdAt = dto.createdAt.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ")
        self.author = dto.user.name
        self.description = dto.description
        self.thumbnailUrl = dto.urls.thumb
        self.regularUrl = dto.urls.regular
        self.fullUrl = dto.urls.full
    }
}
