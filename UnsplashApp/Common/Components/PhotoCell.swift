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
        iv.setRadius(20)
        return iv
    }()
    
    private lazy var container: UIView = {
        let v = UIView()
        v.setRadius(20)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        contentView.backgroundColor = .clear
        contentView.addSubview(container)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        container.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.leading.verticalEdges.equalToSuperview()
            make.width.equalTo(88)
        }
    }
}
