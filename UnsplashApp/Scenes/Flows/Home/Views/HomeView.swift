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
        cv.contentInsetAdjustmentBehavior = .always
        cv.refreshControl = refreshControl
        cv.register(
            LoadingCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: String(describing: LoadingCell.self)
        )
        return cv
    }()
    
    private(set) lazy var refreshControl = UIRefreshControl()
    
    private(set) lazy var paginationIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .medium)
        ai.hidesWhenStopped = true
        return ai
    }()
    
    private(set) lazy var searchController: UISearchController = {
        let sc = UISearchController()
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = L.search.value
        return sc
    }()
    
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
            make.edges.equalToSuperview()
        }
    }
}
