//
//  SearchDTO.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation

struct SearchDTO: Decodable {
    let results: [PhotoDTO]
}
