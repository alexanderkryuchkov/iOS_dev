//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 10.05.2022.
//

import UIKit

protocol PhotosCollectionViewCellDelegate: AnyObject {
    
    func collectionScrollDisable(image: UIImageView)
    
    func collectionScrollEnable(image: UIImageView)
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
        
        if !isTap {
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                
                self.photoImage.removeFromSuperview()
                
                NSLayoutConstraint.deactivate([
                    self.photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                    self.photoImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                    self.photoImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                    self.photoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
                ])
                
                self.delegate?.collectionScrollDisable(image: self.photoImage)


    //            self.contentView.addSubview(self.photoImage)
    //                self.contentView.bringSubviewToFront(self.photoImage)
    //                self.photoImage.layer.zPosition = 1
    //
    //            NSLayoutConstraint.activate([
    //                self.photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
    //                self.photoImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
    //                self.photoImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
    //                self.photoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
    //            ])
                
//                self.oldXImageView = self.photoImage.layer.position.x
//                self.oldYImageView = self.photoImage.layer.position.y
//                
//                self.photoImage.layer.position = CGPoint(x: 0, y: 0)
//
//                self.photoImage.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
//                self.photoImage.contentMode = .scaleAspectFit
//                self.photoImage.clipsToBounds = true
//                            
//                self.contentView.isUserInteractionEnabled = false
//                self.contentView.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                }
            }
            
            isTap = true
            
        }else {
            
            self.delegate?.collectionScrollEnable(image: self.photoImage)

            
            isTap = false
        }

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
