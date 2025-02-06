//
//  PhotosEndpoint.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Network

enum PhotosEndpoint: UnsplashEndpoint {
    case listPhotos(page: Int, perPage: Int)
    
    var path: String {
        switch self {
        case .listPhotos:
            "/photos"
        }
    }
    
    var method: Network.HTTPMethod {
        switch self {
        case .listPhotos:
            return .GET
        }
    }
    
    var queryParams: [String : Any]? {
        switch self {
        case .listPhotos(page: let page, perPage: let perPage):
            return ["page": page, "per_page": perPage]
        }
    }
}
