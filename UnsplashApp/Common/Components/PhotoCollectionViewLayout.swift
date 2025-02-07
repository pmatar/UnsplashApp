//
//  PhotoCollectionViewLayout.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import UIKit

extension UICollectionViewLayout {
    static func photoCollectionLayout(withFooter: Bool = false) -> UICollectionViewCompositionalLayout {
        let item = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), padding: 1)
        
        let fullItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), padding: 1)
        
        let vGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), item: fullItem, count: 2)
        
        let hGroup = CompositionalLayout.createGroup(alignment: .horizontal,
                                                     width: .fractionalWidth(1),
                                                     height: .fractionalHeight(0.6),
                                                     items: [item, vGroup])
        
        let mainItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.4), padding: 1)
        
        let mainGroup = CompositionalLayout.createGroup(alignment: .vertical,
                                                        width: .fractionalWidth(1),
                                                        height: .fractionalHeight(0.9),
                                                        items: [mainItem, hGroup])
        
        let section = NSCollectionLayoutSection(group: mainGroup)
        
        if withFooter {
            let footerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(44)
            )
            
            let footer = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: footerSize,
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
            section.boundarySupplementaryItems = [footer]
        }
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
