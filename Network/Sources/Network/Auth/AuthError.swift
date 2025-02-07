//
//  AuthError.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

public enum AuthError: LocalizedError, CustomDebugStringConvertible {
    case missingToken
    case missingRefreshToken
    case invalidToken
    case forbidden
    case unauthorized
    
    public var localizedDescription: String { return self.debugDescription }
    public var errorDescription: String? { return self.debugDescription }
    
    public var debugDescription: String {
        switch self {
        case .missingToken:
            return "Authentication token is missing."
        case .missingRefreshToken:
            return "Refresh token is missing."
        case .invalidToken:
            return "The token provided is invalid."
        case .forbidden:
            return "Access is forbidden."
        case .unauthorized:
            return "You are not authorized."
        }
    }
}
