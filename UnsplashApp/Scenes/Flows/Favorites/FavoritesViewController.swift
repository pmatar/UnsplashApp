//
//  FavoritesViewController.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class FavoritesViewController: BaseViewController<FavoritesView> {
    private let viewModel: FavoritesViewModel
    private lazy var dataSource = configureDataSource()
    
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        super.init()
        tabBarItem = UITabBarItem(title: L.favorites.value, image: UIImage(systemName: "heart.fill"), tag: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindViewModel()
    }
}

// MARK: - Private methods
extension FavoritesViewController {
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = L.favorites.value
        customView.collectionView.delegate = self
        definesPresentationContext = true
    }
    
    private func bindViewModel() {
        viewModel.favorites
            .receive(on: DispatchQueue.main)
            .sink { [weak self] photos in
                self?.makeSnapshot(photos)
            }
            .store(in: &cancellables)
    }
}

// MARK: - Collection Setup
extension FavoritesViewController {
    fileprivate typealias PhotoDataSource = UICollectionViewDiffableDataSource<Int, Photo>
    fileprivate typealias PhotoSnapshot = NSDiffableDataSourceSnapshot<Int, Photo>
    
    private func configureDataSource() -> PhotoDataSource {
        let cellRegistration = UICollectionView.CellRegistration<PhotoCell, Photo> { cell, _, model in
            cell.configure(with: model)
        }
        
        let dataSource = PhotoDataSource(collectionView: customView.collectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        return dataSource
    }
    
    private func makeSnapshot(_ items: [Photo]) {
        var snapshot = PhotoSnapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(items)
        dataSource.apply(snapshot)
    }
}

// MARK: - UICollectionViewDelegate
extension FavoritesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        guard let model = dataSource.itemIdentifier(for: indexPath) else { return }
        viewModel.onSelect?(model)
    }
}
