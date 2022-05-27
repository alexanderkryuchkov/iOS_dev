//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 10.05.2022.
//

import UIKit

protocol PhotosCollectionViewCellDelegate: AnyObject {
    
    func collectionScrollDisable(image: UIImageView)
    
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: PhotosCollectionViewCellDelegate?
    
    private var oldXImageView = CGFloat()
    private var oldYImageView = CGFloat()
    private var isTap = false
        
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customizeCell()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ photo: PhotoModel) {
        photoImage.image = UIImage(named: photo.image)

    }
    
    func setupGesture() {
        let tappGesture = UITapGestureRecognizer(target: self, action: #selector(tappAction))
        photoImage.addGestureRecognizer(tappGesture)
        photoImage.isUserInteractionEnabled = true
    }

        
    @objc func tappAction() {
        self.delegate?.collectionScrollDisable(image: self.photoImage)
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
