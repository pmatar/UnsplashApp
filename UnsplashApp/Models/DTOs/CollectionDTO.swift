//
//  CollectionDTO.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

struct CollectionDTO: Codable {
   let id: Int
   let title: String
   let publishedAt, lastCollectedAt, updatedAt: String
   let coverPhoto: String?
   let user: UserDTO?
   
   enum CodingKeys: String, CodingKey {
       case id, title, user
       case publishedAt = "published_at"
       case lastCollectedAt = "last_collected_at"
       case updatedAt = "updated_at"
       case coverPhoto = "cover_photo"
   }
}
