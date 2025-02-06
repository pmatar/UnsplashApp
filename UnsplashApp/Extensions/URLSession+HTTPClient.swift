//
//  URLSession+HTTPClient.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//


import Foundation
import os
import Network

extension URLSession: @retroactive HTTPClient {
    public func send(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        guard URLSession.isConnected else {
            throw HTTPError.noInternetConnection
        }
        
        Log.request(request)
        let (data, response) = try await data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.badServerResponse
        }
        
        Log.response(httpResponse, data: data)
        return (data, httpResponse)
    }
}
