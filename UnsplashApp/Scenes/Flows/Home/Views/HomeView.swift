//
//  HomeView.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class HomeView: BaseView {
    // MARK: - Outlets
    private(set) lazy var collectionView: PhotoCollectionView = {
        let cv = PhotoCollectionView()
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.keyboardDismissMode = .onDrag
        cv.contentInset = .init(top: 16, left: 0, bottom: 0, right: 0)
        cv.refreshControl = refreshControl
        return cv
    }()
    
    private(set) lazy var refreshControl = UIRefreshControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
}

// MARK: - Private methods
extension HomeView {
    private func setupViews() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
        }
    }
}
