//
//  DetailsView.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import UIKit

final class DetailsView: BaseView {
    // MARK: - Outlets
    private(set) var photoImageView: AsyncImageView = {
        let imageView = AsyncImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.tintColor = .black
        return button
    }()
    
    private(set) var detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension DetailsView {
    func configure(with photo: Photo, isSelected: Bool) {
        photoImageView.setImage(photo.regularUrl)
        likeButton.isSelected = isSelected
        detailStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let dateFormatter = DateFormatter.standard
        dateFormatter.dateStyle = .medium
        
        let detailLabels = [
            (L.creationDate.value, dateFormatter.string(from: photo.createdAt ?? Date())),
            (L.author.value, photo.author),
            (L.location.value, photo.location ?? L.locationNotSpecified.value),
            (L.description.value, photo.description ?? L.descriptionNotAvailable.value)
        ]
        
        detailLabels.forEach { (title, value) in
            let label = UILabel()
            label.text = "\(title): \(value)"
            label.numberOfLines = 0
            detailStackView.addArrangedSubview(label)
        }
    }
}

// MARK: - Private methods
extension DetailsView {
    private func setupViews() {
        backgroundColor = .white
        addSubviews(photoImageView, likeButton, detailStackView)
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(450)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(44)
        }
        
        detailStackView.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(likeButton.snp.leading).offset(-10)
        }
    }
}
