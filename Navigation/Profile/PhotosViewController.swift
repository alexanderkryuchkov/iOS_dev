//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 10.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let photoModel = PhotoModel.makePhotoModel()
    
    private var array: [Int] {
        var array = [Int]()
        for item in 0...19 {
            array.append(item)
        }
        return array
    }

    private lazy var photoCollection: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layot)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .white
        
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collection
    }()
    
    
    private lazy var buttonCancel: UIButton = {
        let button = UIButton()
        button.layer.opacity = 0
        button.setImage(UIImage(systemName: "xmark.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(cancelAnimationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .black
        view.alpha = 0.6
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        return view
    }()
    
    private var fullScreenImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "photo1"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.opacity = 0
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Photo Gallery"
        view.backgroundColor = .systemGray6
        
        layot()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func layot() {
        [photoCollection, blackView, fullScreenImageView, buttonCancel].forEach({view.addSubview($0)})
        
        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //констрейнты для полноэкранного фото
            fullScreenImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullScreenImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fullScreenImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            fullScreenImageView.heightAnchor.constraint(equalTo: fullScreenImageView.widthAnchor, multiplier: 1),
            
            //констрейнты для кнопки выход
            buttonCancel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            buttonCancel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            buttonCancel.widthAnchor.constraint(equalToConstant: 40),
            buttonCancel.heightAnchor.constraint(equalTo: buttonCancel.widthAnchor, multiplier: 1)
        ])
    }

}


// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.delegate = self
        cell.setupCell(photoModel[indexPath.row])

        return cell
        
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat {return 8}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}


// MARK: - ProfileHeaderDelegate (отключает/включает скролл при раскрытии/закрытии аватарки)

extension PhotosViewController: PhotosCollectionViewCellDelegate {
    
    func collectionScrollDisable(image: UIImageView) {
        

        self.fullScreenImageView.image = image.image
        self.fullScreenImageView.isUserInteractionEnabled = true
        self.navigationController?.isNavigationBarHidden = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            
            self.blackView.layer.opacity = 0.85
            self.fullScreenImageView.layer.opacity = 1
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0.0) {
            self.buttonCancel.layer.opacity = 1
            }
        }
    }
    
    @objc func cancelAnimationButton() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.buttonCancel.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.blackView.layer.opacity = 0.0
                self.fullScreenImageView.layer.opacity = 0
                self.navigationController?.isNavigationBarHidden = false
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

