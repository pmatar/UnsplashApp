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
    case search = "search_key"
    case creationDate = "creation_date"
    case author = "author"
    case location = "location"
    case locationNotSpecified = "location_not_specified"
    case description = "description"
    case descriptionNotAvailable = "description_not_available"
    
    var value: String {
        NSLocalizedString(rawValue, comment: "")
    }
}
