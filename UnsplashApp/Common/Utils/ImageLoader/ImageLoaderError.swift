//
//  ImageLoaderError.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation

enum ImageLoaderError: LocalizedError, CustomDebugStringConvertible {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case imageConversionFailed
    
    var localizedDescription: String { return self.debugDescription }
    var errorDescription: String? { return self.debugDescription }
    
    var debugDescription: String {
        switch self {
        case .invalidURL:
            return "The provided URL is invalid."
        case .invalidResponse:
            return "The response from the server is invalid."
        case .invalidStatusCode(let code):
            return "Received an invalid status code: \(code)."
        case .imageConversionFailed:
            return "Failed to convert data to an image."
        }
    }
}
