//
//  Endpoint.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

public protocol Endpoint: HTTPRequestProvider {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParams: [String: Any]? { get }
    var body: HTTPBody { get }
    var contentType: String? { get }
    var headers: [String: LosslessStringConvertible] { get }
    var timeoutInterval: Double { get }
    var cachePolicy: URLRequest.CachePolicy { get }
}
