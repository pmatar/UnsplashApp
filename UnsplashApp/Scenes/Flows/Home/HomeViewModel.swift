//
//  HomeViewModel.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Inject
import Combine

final class HomeViewModel: HomeOutput {
    private(set) var photos = CurrentValueSubject<[Photo], Never>([])
    @Injected private var repository: PhotosRepository
    
    func fetch() async {
        do {
            let response = try await repository.fetchPhotos(page: 1)
            photos.send(response)
        } catch {
            Log.error(error)
        }
    }
}
