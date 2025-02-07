//
//  HomeViewModel.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Inject

final class HomeViewModel: HomeOutput {
    @Injected private var repository: PhotosRepository
    
    func fetch() async {
        do {
            let response = try await repository.fetchPhotos(page: 1)
        } catch {
            Log.error(error)
        }
    }
}
