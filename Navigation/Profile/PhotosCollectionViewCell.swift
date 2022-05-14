//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 10.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
        
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ photo: PhotoModel) {
        photoImage.image = UIImage(named: photo.image)

    }
    
    private func customizeCell() {
        contentView.addSubview(photoImage)
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
