//
//  ImageLoadable.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import UIKit

protocol ImageLoadable: Actor {
    func load(from link: String) async throws -> UIImage
    func load(from link: String, cached: Bool) async throws -> UIImage
}

actor ImageLoader: ImageLoadable {
    private var cache = NSCache<NSString, UIImage>()
    
    func load(from link: String) async throws -> UIImage {
        try await load(from: link, cached: true)
    }
    
    func load(from link: String, cached: Bool) async throws -> UIImage {
        guard let url = URL(string: link) else {
            throw ImageLoaderError.invalidURL
        }
        
        let key = url.absoluteString
        
        if cached, let cachedImage = cache.object(forKey: key as NSString) {
            return cachedImage
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw ImageLoaderError.invalidResponse
        }
        
        guard (200..<300) ~= response.statusCode else {
            throw ImageLoaderError.invalidStatusCode(response.statusCode)
        }
        
        guard let image = UIImage(data: data) else {
            throw ImageLoaderError.imageConversionFailed
        }
        
        if cached {
            cache.setObject(image, forKey: key as NSString)
        }
        
        return image
    }
}
