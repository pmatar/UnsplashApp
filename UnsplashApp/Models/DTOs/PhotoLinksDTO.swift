//
//  PhotoLinksDTO.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

struct PhotoLinksDTO: Decodable {
   let `self`, html, download, downloadLocation: String
   
   enum CodingKeys: String, CodingKey {
       case `self`, html, download
       case downloadLocation = "download_location"
   }
}
