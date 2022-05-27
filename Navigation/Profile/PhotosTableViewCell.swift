//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 10.05.2022.
//

import UIKit

protocol PhotosTableDelegate: AnyObject {
    func buttonPressed()
}


class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableDelegate?
    
    private let photoImageCount: Int = 4
        
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.text = "Photos"
        return label
    }()
    
    private let autorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.text = "autorLabel"
        return label
    }()
    
    private let photoButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.setImage(UIImage(systemName: "arrow.forward")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var photoImageView: [UIImageView] = {
        
        var phImageView: [UIImageView] = []
        
        for _ in 1 ... 4 {

            let imageView: UIImageView = {
                let imageView = UIImageView()
                imageView.backgroundColor = .white
                imageView.contentMode = .scaleAspectFill
                imageView.clipsToBounds = true
                imageView.layer.cornerRadius = 6

                imageView.translatesAutoresizingMaskIntoConstraints = false
                return imageView
            }()
            phImageView.append(imageView)
        }
        return phImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func buttonPressed() {
        delegate?.buttonPressed()
    }
    
    
    private func createImageView(count: Int) {
        
    }
    
    func setupGesture() {
        
        for item in photoImageView {
            let tappGesture = UITapGestureRecognizer(target: self, action: #selector(buttonPressed))
            item.addGestureRecognizer(tappGesture)
            item.isUserInteractionEnabled = true
        }
    }
    
    func setupCell(_ photo: [PhotoModel]) {
        
        for item in 0 ... (photoImageCount - 1) {
            photoImageView[item].image = UIImage(named: photo[item].image)
        }

    }
    
    func layout() {
                
        let imageSize = (UIScreen.main.bounds.width - 48) / CGFloat(photoImageCount)
        
        contentView.addSubview(mainView)
        
        [self.titleLabel, self.photoButton].forEach{
            mainView.addSubview($0)
        }
            
        NSLayoutConstraint.activate([
            // Constraint - mainView
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Constraint - titleLabel
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
            
            // Constraint - titleLabel
            photoButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            photoButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -12),
        ])
        
        for item in 0 ... (photoImageCount - 1) {
            mainView.addSubview(photoImageView[item])
            
            if item == 0 {
                NSLayoutConstraint.activate([
                photoImageView[item].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
                photoImageView[item].leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                photoImageView[item].bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -12),
                photoImageView[item].widthAnchor.constraint(equalToConstant: imageSize),
                photoImageView[item].heightAnchor.constraint(equalToConstant: imageSize)
                ])
            }else{
                NSLayoutConstraint.activate([
                photoImageView[item].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
                photoImageView[item].leadingAnchor.constraint(equalTo: photoImageView[item-1].trailingAnchor, constant: 8),
                photoImageView[item].widthAnchor.constraint(equalToConstant: imageSize),
                photoImageView[item].heightAnchor.constraint(equalToConstant: imageSize)
                ])
            }

        }
    }
    
}
