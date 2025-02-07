//
//  PhotoCollectionView.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import UIKit

final class PhotoCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: .photoCollectionLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UICollectionViewLayout {
    static let photoCollectionLayout: UICollectionViewCompositionalLayout = {
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
                                                        height: .fractionalHeight(0.5),
                                                        items: [mainItem, hGroup])
        
        let section = NSCollectionLayoutSection(group: mainGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }()
}
