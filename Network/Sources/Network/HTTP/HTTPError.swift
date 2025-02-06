//
//  HTTPError.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

public enum HTTPError: LocalizedError, CustomDebugStringConvertible {
    case noInternetConnection
    case invalidURL
    case unsupportedURL
    case badServerResponse
    case serverError
    case badRequest
    case invalidServerResponseWithCode(Int)
    
    public var localizedDescription: String { return self.debugDescription }
    public var errorDescription: String? { return self.debugDescription }
    
    public var debugDescription: String {
        switch self {
        case .noInternetConnection:
            return "No internet connection."
        case .invalidURL:
            return "The URL provided is invalid."
        case .unsupportedURL:
            return "The URL scheme is not supported."
        case .badServerResponse:
            return "The server response could not be understood."
        case .serverError:
            return "The server encountered an internal error."
        case .badRequest:
            return "The request was malformed or contained invalid parameters."
        case .invalidServerResponseWithCode(let code):
            return "The server returned an error with code \(code)."
        }
    }
}
