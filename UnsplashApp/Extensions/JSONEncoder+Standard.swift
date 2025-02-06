//
//  JSONEncoder+Standard.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

extension JSONEncoder {
    static let standard: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .base64
        encoder.dateEncodingStrategy = .formatted(DateFormatter.standard)
        return encoder
    }()
}
