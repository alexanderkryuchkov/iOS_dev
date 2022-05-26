//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 10.05.2022.
//

import UIKit

protocol PhotosCollectionViewCellDelegate: AnyObject {
    
    func collectionScrollDisable()
    
    func collectionScrollEnable()
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: PhotosCollectionViewCellDelegate?
    
    private var oldXImageView = CGFloat()
    private var oldYImageView = CGFloat()
        
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
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            
            self.oldXImageView = self.photoImage.layer.position.x
            self.oldYImageView = self.photoImage.layer.position.y
            
            self.photoImage.layer.position = CGPoint(x: self.contentView.center.x, y: UIScreen.main.bounds.height / 2)
            self.photoImage.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
            

            
            self.contentView.isUserInteractionEnabled = false
            self.contentView.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
            }
        }
        
        delegate?.collectionScrollDisable()

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
