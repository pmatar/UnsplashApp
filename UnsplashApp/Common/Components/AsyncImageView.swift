//
//  AsyncImageView.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//


import UIKit
import Inject

final class AsyncImageView: UIImageView {
    @Injected private var imageLoader: ImageLoadable
    
    private var imageUrl: String? {
        didSet {
            dowloadImage()
        }
    }
    
    func setImage(_ imageUrl: String?, placeholder: UIImage? = nil) {
        self.image = placeholder
        self.imageUrl = imageUrl
    }
    
    private func dowloadImage() {
        guard let imageUrl else { return }
        
        Task { @MainActor in
            do {
                let loadedImage = try await imageLoader.load(from: imageUrl)
                if imageUrl == self.imageUrl {
                    image = loadedImage
                }
            } catch {
                debugPrint(error)
            }
        }
    }
}
