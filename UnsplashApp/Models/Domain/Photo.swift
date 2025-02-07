//
//  Photo.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation

struct Photo {
    let id: String
    let location: String?
    let createdAt: Date?
    let author: String
    let thumbnailUrl: URL?
    let regularUrl: URL?
    let fullUrl: URL?
}

// MARK: - DTO initializer
extension Photo {
    init(dto: PhotoDTO) {
        self.id = dto.id
        self.location = dto.user.location
        self.createdAt = dto.createdAt.toDate()
        self.author = dto.user.name
        self.thumbnailUrl = URL(string: dto.urls.thumb)
        self.regularUrl = URL(string: dto.urls.regular)
        self.fullUrl = URL(string: dto.urls.full)
    }
}
