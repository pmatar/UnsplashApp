//
//  Localization.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

enum L: String {
    case main = "main_key"
    case favorites = "favorites_key"
    case photos = "photos_key"
    
    var value: String {
        NSLocalizedString(rawValue, comment: "")
    }
}
