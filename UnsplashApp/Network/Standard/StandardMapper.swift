//
//  StandardMapper.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

public struct StandardMapper: HTTPResponseMapper {
    private let decoder: JSONDecoder
    
    public init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    public func map<T>(data: Data, response: HTTPURLResponse) throws -> T where T : Decodable {
        switch response.statusCode {
        case 200...299:
            return try decoder.decode(T.self, from: data)
        case 500...599:
            throw HTTPError.serverError
        case 400:
            throw HTTPError.badRequest
        case 401:
            throw AuthError.unauthorized
        case 403:
            throw AuthError.forbidden
        default:
            throw HTTPError.invalidServerResponseWithCode(response.statusCode)
        }
    }
}
