//
//  PhotoDTO.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

struct PhotoDTO: Codable {
   let id: String
   let createdAt, updatedAt: String
   let width, height: Int
   let color, blurHash: String
   let likes: Int
   let likedByUser: Bool
   let description: String?
   let user: UserDTO
   let currentUserCollections: [CollectionDTO]
   let urls: UrlsDTO
   let links: PhotoLinksDTO
   
   enum CodingKeys: String, CodingKey {
       case id, width, height, color, likes, description, user, urls, links
       case createdAt = "created_at"
       case updatedAt = "updated_at"
       case blurHash = "blur_hash"
       case likedByUser = "liked_by_user"
       case currentUserCollections = "current_user_collections"
   }
}
