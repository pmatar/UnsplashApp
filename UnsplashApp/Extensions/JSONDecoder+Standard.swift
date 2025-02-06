//
//  JSONDecoder+Standard.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

extension JSONDecoder {
    static let standard: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .base64
        decoder.dateDecodingStrategy = .formatted(DateFormatter.standard)
        return decoder
    }()
}
