//
//  UnsplashEndpoint.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Network

protocol UnsplashEndpoint: Endpoint {}

extension UnsplashEndpoint {
    var baseURL: URL? {
        URL(string: Environment.baseURL)
    }
    
    var headers: [String : any LosslessStringConvertible] {
        ["Authorization": "Client-ID YOUR_ACCESS_KEY"]
    }
}
