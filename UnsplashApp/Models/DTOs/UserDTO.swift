//
//  UserDTO.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

struct UserDTO: Decodable {
   let id, username, name: String
   let portfolioUrl: String?
   let bio, location: String?
   let totalLikes, totalPhotos, totalCollections: Int
   let instagramUsername, twitterUsername: String?
   let profileImage: ProfileImageDTO
   let links: UserLinksDTO
   
   enum CodingKeys: String, CodingKey {
       case id, username, name, bio, location, links
       case portfolioUrl = "portfolio_url"
       case totalLikes = "total_likes"
       case totalPhotos = "total_photos"
       case totalCollections = "total_collections"
       case instagramUsername = "instagram_username"
       case twitterUsername = "twitter_username"
       case profileImage = "profile_image"
   }
}
