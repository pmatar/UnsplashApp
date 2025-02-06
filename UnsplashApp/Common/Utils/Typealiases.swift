//
//  Typealiases.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation

typealias Closure<T> = (T) -> Void
typealias EmptyClosure = () -> Void
typealias Module<T: Output> = (module: Presentable, output: T)
