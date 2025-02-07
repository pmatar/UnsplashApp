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
    var onSelect: Closure<Photo>?
    
    private(set) var photos = CurrentValueSubject<[Photo], Never>([])
    private(set) var currentQuery = CurrentValueSubject<String, Never>("")
    private(set) var canPaginate: Bool = true
    
    private var currentPage = 0
    @Injected private var repository: PhotosRepository
}

// MARK: - Public methods
extension HomeViewModel {
    func search(query: String) async {
        currentPage = 0
        photos.send([])
        await fetch(with: query)
    }
    
    func paginate() async {
        await fetch(with: currentQuery.value)
    }
    
    func fetch(with query: String = "") async {
        canPaginate = false
        defer { canPaginate = true }
        
        do {
            let response = if query.isEmpty {
                try await repository.fetchPhotos(page: currentPage + 1)
            } else {
                try await repository.searchPhotos(query: query, page: currentPage + 1)
            }
            
            currentPage += 1
            
            let currentIds = Set(photos.value.map(\.id))
            let newPhotos = response.filter { !currentIds.contains($0.id) }
            
            photos.send(photos.value + newPhotos)
        } catch {
            Log.error(error)
        }
    }
    
    func refresh() async {
        do {
            let response = try await repository.fetchPhotos(page: 0)
            
            await MainActor.run {
                currentPage = 0
                photos.send([])
                photos.send(response)
            }
        } catch {
            Log.error(error)
        }
    }
}
