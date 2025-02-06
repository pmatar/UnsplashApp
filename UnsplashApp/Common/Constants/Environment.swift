//
//  Environment.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

enum Environment {
    static let baseURL: String = {
        if let baseURL = Bundle.main.object(forInfoDictionaryKey: Keys.baseURL) as? String {
            return "https://\(baseURL)"
        }
        return ""
    }()
    
    static let apiKey: String = {
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: Keys.apiKey) as? String {
            return apiKey
        }
        return ""
    }()
}

// MARK: - Keys
fileprivate extension Environment {
    enum Keys {
        static let baseURL = "BASE_URL"
        static let apiKey = "API_KEY"
    }
}


