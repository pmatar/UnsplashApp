//
//  Coordinator.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

protocol Coordinator: AnyObject {
    var didFinish: EmptyClosure? { get set }
    
    func start()
}
