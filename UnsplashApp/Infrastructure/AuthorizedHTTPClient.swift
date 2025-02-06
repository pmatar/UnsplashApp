//
//  AuthorizedHTTPClient.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Network

final class AuthorizedHTTPClient: HTTPClient {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = URLSession.shared) {
        self.httpClient = httpClient
    }
    
    func send(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        var authorizedRequest = request
        authorizedRequest.setValue("Client-ID \(Environment.apiKey)", forHTTPHeaderField: "Authorization")
        return try await httpClient.send(request: authorizedRequest)
    }
}
