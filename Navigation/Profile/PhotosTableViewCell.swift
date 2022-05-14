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
    
    let photoButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.setImage(UIImage(systemName: "arrow.forward")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let photoImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photoImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photoImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photoImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    @objc func buttonPressed() {
        delegate?.buttonPressed()
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCell(_ photo: PhotoModel) {
        
        photoImageView1.image = UIImage(named: photo.image)
        photoImageView2.image = UIImage(named: photo.image)
        photoImageView3.image = UIImage(named: photo.image)
        photoImageView4.image = UIImage(named: photo.image)

    }
    
    func layout() {
        
//        let insert: CGFloat = 8
        
        let imageSize = (UIScreen.main.bounds.width - 48) / 4

        
        contentView.addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(photoButton)
        mainView.addSubview(photoImageView1)
        mainView.addSubview(photoImageView2)
        mainView.addSubview(photoImageView3)
        mainView.addSubview(photoImageView4)

        
        NSLayoutConstraint.activate([
            // Constraint - mainView
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Constraint - titleLabel
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
//            titleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 12),
            
            // Constraint - titleLabel
            photoButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
//            photoButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
            photoButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -12),

            // Constraint - photoImageView
            photoImageView1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photoImageView1.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            photoImageView1.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -12),
            photoImageView1.widthAnchor.constraint(equalToConstant: imageSize),
            photoImageView1.heightAnchor.constraint(equalToConstant: imageSize),
            
            
            photoImageView2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photoImageView2.leadingAnchor.constraint(equalTo: photoImageView1.trailingAnchor, constant: 8),
            photoImageView2.widthAnchor.constraint(equalToConstant: imageSize),
            photoImageView2.heightAnchor.constraint(equalToConstant: imageSize),
            
            
            photoImageView3.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photoImageView3.leadingAnchor.constraint(equalTo: photoImageView2.trailingAnchor, constant: 8),
            photoImageView3.widthAnchor.constraint(equalToConstant: imageSize),
            photoImageView3.heightAnchor.constraint(equalToConstant: imageSize),
            
            
            photoImageView4.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photoImageView4.leadingAnchor.constraint(equalTo: photoImageView3.trailingAnchor, constant: 8),
            photoImageView4.widthAnchor.constraint(equalToConstant: imageSize),
            photoImageView4.heightAnchor.constraint(equalToConstant: imageSize)

        ])
    }
    
    
}
