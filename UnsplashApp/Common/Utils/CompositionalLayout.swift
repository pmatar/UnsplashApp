//
//  CompositionalLayout.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import UIKit

struct CompositionalLayout {
    
    enum Alignment {
        case vertical
        case horizontal
    }
    
    static func createItem(width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension, padding: CGFloat) -> NSCollectionLayoutItem {
        let size = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
        return item
    }
    
    static func createGroup(alignment: Alignment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        let size = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: items)
        }
    }
    
    static func createGroup(alignment: Alignment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            item: NSCollectionLayoutItem,
                            count: Int) -> NSCollectionLayoutGroup {
        let size = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: count)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: count)
        }
    }
}
