//
//  UnsplashService.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Network
import Inject

protocol UnsplashServiceProtocol {
    
}

struct UnsplashService: UnsplashServiceProtocol {
    @Injected private var httpClient: HTTPClient
    @Injected private var httpMapper: HTTPResponseMapper
    
}
