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
    
    private var imageUrl: String?
    private var loadingTask: Task<Void, Never>?
    
    deinit {
        loadingTask?.cancel()
        loadingTask = nil
    }
}

// MARK: - Public methods
extension AsyncImageView {
    func setImage(_ imageUrl: String?, placeholder: UIImage?) {
        self.image = placeholder
        guard self.imageUrl != imageUrl else { return }
        self.imageUrl = imageUrl
        
        loadingTask?.cancel()
        downloadImage()
    }
}

// MARK: - Private methods
extension AsyncImageView {
    private func downloadImage() {
        guard let imageUrl else { return }
        
        loadingTask = Task { [weak self] in
            guard let self else { return }
            
            do {
                let loadedImage = try await imageLoader.load(from: imageUrl)
                
                if imageUrl == self.imageUrl {
                    await MainActor.run {
                        self.image = loadedImage
                    }
                }
            } catch {
                Log.error(error)
            }
        }
    }
}
