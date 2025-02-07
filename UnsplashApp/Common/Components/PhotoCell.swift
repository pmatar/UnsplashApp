//
//  PhotoCell.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    private lazy var imageView: AsyncImageView = {
        let iv = AsyncImageView()
        iv.contentMode = .scaleAspectFill
        iv.setRadius(4, mask: true)
        return iv
    }()
    
    private lazy var container: UIView = {
        let v = UIView()
        v.setRadius(4, mask: true)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}

// MARK: - Public methods
extension PhotoCell {
    func configure(with model: Photo) {
        imageView.setImage(model.thumbnailUrl)
    }
}

// MARK: - Private methods
extension PhotoCell {
    private func setupViews() {
        contentView.addSubview(container)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        container.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
