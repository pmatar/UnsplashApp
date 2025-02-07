//
//  Typealiases.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import Foundation
import Navigation

typealias Closure<T> = (T) -> Void
typealias EmptyClosure = () -> Void
typealias Module<T> = (module: any Presentable, output: T)
typealias CoordinatorBox = (coordinator: any Coordinator, presenter: any Presentable)
