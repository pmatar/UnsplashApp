//
//  FavoritesOutput.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

protocol FavoritesOutput: Output {
    var onSelect: Closure<Photo>? { get set }
}
