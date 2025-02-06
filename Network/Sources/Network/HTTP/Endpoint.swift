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

// MARK: - Default
public extension Endpoint {
    var queryParams: [String: Any]? {
        nil
    }
    
    var body: HTTPBody {
        .none
    }
    
    var contentType: String? {
        "application/json"
    }
    
    var headers: [String: LosslessStringConvertible] {
        [:]
    }
    
    var timeoutInterval: Double {
        60
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        .reloadIgnoringLocalAndRemoteCacheData
    }
}

// MARK: - HTTPRequestProvider
public extension Endpoint {
    func request() throws -> URLRequest {
        guard let url = baseURL else {
            throw HTTPError.invalidURL
        }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw HTTPError.unsupportedURL
        }
        
        components.path = path
        
        if let queryParams = queryParams {
            components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let requestURL = components.url else {
            throw HTTPError.unsupportedURL
        }
        
        var urlRequest = URLRequest(
            url: requestURL,
            cachePolicy: cachePolicy,
            timeoutInterval: timeoutInterval
        )
        
        urlRequest.httpMethod = method.rawValue
        
        if let contentType = contentType {
            urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        }
        
        if let httpBody = try body.toData() {
            urlRequest.httpBody = httpBody
            urlRequest.setValue("\(httpBody.count)", forHTTPHeaderField: "Content-Length")
        }
        
        for (key, value) in headers {
            urlRequest.addValue(value.description, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}
