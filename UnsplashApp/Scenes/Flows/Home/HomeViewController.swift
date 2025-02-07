//
//  HomeViewController.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

final class HomeViewController: BaseViewController<HomeView> {
    private let viewModel: HomeViewModel
    private lazy var dataSource = configureDataSource()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
        tabBarItem = UITabBarItem(title: L.main.value, image: UIImage(systemName: "house.fill"), tag: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindVieModel()
        Task { await viewModel.fetch() }
    }
}

// MARK: - Private methods
extension HomeViewController {
    private func setupViews() {
        title = L.photos.value
        customView.collectionView.delegate = self
    }
    
    private func bindVieModel() {
        viewModel.photos
            .receive(on: DispatchQueue.main)
            .sink { [weak self] photos in
                guard let self else { return }
                makeSnapshot(photos)
            }.store(in: &cancellables)
    }
}

// MARK: - Collection Setup
extension HomeViewController {
    fileprivate typealias PhotoDataSource = UICollectionViewDiffableDataSource<Int, Photo>
    fileprivate typealias PhotoSnapshot = NSDiffableDataSourceSnapshot<Int, Photo>
    
    private func configureDataSource() -> PhotoDataSource {
        let cellRegistration = UICollectionView.CellRegistration<PhotoCell, Photo> { cell, _, model in
            cell.configure(with: model)
        }
        
        let dataSource = PhotoDataSource(collectionView: customView.collectionView) { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        return dataSource
    }
    
    private func makeSnapshot(_ items: [Photo]) {
        var snapshot = PhotoSnapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(items, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        guard let model = dataSource.itemIdentifier(for: indexPath) else { return }

    }
}
