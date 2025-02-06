//
//  Injected.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

@propertyWrapper
public struct Injected<D> {
    
    private var dependency: D
    
    public init(_ scope: Scope = .global) {
        guard let dependency = Container.shared.resolve(scope: scope, type: D.self) else {
            fatalError("No dependency of type \(String(describing: D.Type.self)) registered!")
        }
        
        self.dependency = dependency
    }
    
    public var wrappedValue: D {
        get { dependency }
        mutating set { dependency = newValue }
    }
}
