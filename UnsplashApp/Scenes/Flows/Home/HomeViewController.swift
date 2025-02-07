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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindVieModel()
        Task { await viewModel.fetch() }
    }
}

// MARK: - Private methods
extension HomeViewController {
    private func setup() {
        tabBarItem = UITabBarItem(title: L.main.value, image: UIImage(systemName: "house.fill"), tag: 1)
        customView.refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        customView.collectionView.delegate = self
        customView.searchController.searchResultsUpdater = self
        navigationItem.searchController = customView.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    private func bindVieModel() {
        viewModel.photos
            .receive(on: DispatchQueue.main)
            .sink { [weak self] photos in
                self?.makeSnapshot(photos)
            }.store(in: &cancellables)
        
        viewModel.currentQuery
            .receive(on: DispatchQueue.main)
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .milliseconds(700), scheduler: DispatchQueue.main)
            .sink { [weak self] query in
                Task { await self?.viewModel.search(query: query) }
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
        
        let dataSource = PhotoDataSource(collectionView: customView.collectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionFooter else { return nil }
            
            let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: String(describing: LoadingCell.self),
                for: indexPath
            ) as? LoadingCell
            
            return footer
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
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        guard let model = dataSource.itemIdentifier(for: indexPath) else { return }
        _ = model.fullUrl
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplaySupplementaryView view: UICollectionReusableView,
        forElementKind elementKind: String,
        at indexPath: IndexPath
    ) {
        guard viewModel.canPaginate else { return }
        guard viewModel.photos.value.count > 19 else { return }
        guard let footer = view as? LoadingCell else { return }
        
        footer.startAnimating()
        Task { await viewModel.fetch() }
        footer.stopAnimating()
    }
}

// MARK: - UISearchResultsUpdating
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        viewModel.currentQuery.send(query)
    }
    
    
}

// MARK: - Actions
extension HomeViewController {
    @objc private func didPullToRefresh() {
        Task {
            await viewModel.refresh()
            await MainActor.run {
                customView.refreshControl.endRefreshing()
            }
        }
    }
}
