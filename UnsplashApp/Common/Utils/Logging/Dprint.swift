//
//  Dprint.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation

@inlinable func dprint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
#if DEBUG
    print(items.lazy.map { "\($0)" }.joined(separator: separator), terminator: terminator)
#endif
}
