//
//  HTTPRequestProvider.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

public protocol HTTPRequestProvider {
    func request() throws -> URLRequest
}
