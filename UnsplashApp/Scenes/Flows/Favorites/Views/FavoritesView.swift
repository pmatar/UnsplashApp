//
//  FavoritesView.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class FavoritesView: BaseView {
    // MARK: - Outlets
    private(set) lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: .photoCollectionLayout())
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.contentInsetAdjustmentBehavior = .always
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
}

// MARK: - Private methods
extension FavoritesView {
    private func setupViews() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
