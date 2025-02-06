//
//  UnsplashService.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Network

protocol UnsplashServiceProtocol {
    
}

struct UnsplashService: UnsplashServiceProtocol {
    private let httpClient: HTTPClient
    private let httpMapper: HTTPResponseMapper
    
    init(httpClient: HTTPClient = URLSession.shared, httpMapper: HTTPResponseMapper = StandardMapper()) {
        self.httpClient = httpClient
        self.httpMapper = httpMapper
    }
    
}
