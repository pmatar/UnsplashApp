//
//  Coordinator.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

public protocol Coordinator: AnyObject {
    var didFinish: (() -> Void)? { get set }
    
    func start()
}
