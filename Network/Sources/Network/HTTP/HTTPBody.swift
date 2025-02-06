//
//  HTTPBody.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

public enum HTTPBody {
    case none
    case data(Data)
    case parameters([String: Any])
    case encodable(any Encodable, encoder: JSONEncoder = JSONEncoder())
    
    func toData() throws -> Data? {
        switch self {
        case .none:
            return nil
        case .data(let data):
            return data
        case .parameters(let dictionary):
            return try JSONSerialization.data(withJSONObject: dictionary)
        case .encodable(let encodable, let encoder):
            return try encoder.encode(encodable)
        }
    }
}
