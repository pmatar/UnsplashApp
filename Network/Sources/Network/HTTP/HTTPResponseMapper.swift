//
//  HTTPResponseMapper.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

public protocol HTTPResponseMapper {
    func map<T: Decodable>(data: Data, response: HTTPURLResponse) throws -> T
}
