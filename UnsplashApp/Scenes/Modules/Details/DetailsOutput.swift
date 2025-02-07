//
//  DetailsOutput.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation

protocol DetailsOutput: Output {
    var onDismiss: EmptyClosure? { get set }
}
