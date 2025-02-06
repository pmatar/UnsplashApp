//
//  Container.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

final class Container {
    private var cache: [ObjectIdentifier: Any] = [:]
    private var generators: [ObjectIdentifier: () -> Any] = [:]
    private let lock = NSRecursiveLock()
    
    static let shared = Container()
    
    private init() {}
    
    func register<D>(
        type: D.Type,
        scope: Scope = .global,
        implementer generator: @autoclosure @escaping () -> D
    ) {
        lock.withLock {
            switch scope {
            case .global:
                cache[ObjectIdentifier(type)] = generator()
                fallthrough
            case .local:
                generators[ObjectIdentifier(type)] = generator
            }
        }
    }
    
    func resolve<D>(
        scope: Scope = .global,
        type: D.Type
    ) -> D? {
        return lock.withLock {
            var dependency: D?
            switch scope {
            case .global:
                if let cachedDependency = cache[ObjectIdentifier(type)] as? D {
                    dependency = cachedDependency
                }
            case .local:
                if let newDependency = generators[ObjectIdentifier(type)]?() as? D {
                    dependency = newDependency
                }
            }
            return dependency
        }
    }
}
