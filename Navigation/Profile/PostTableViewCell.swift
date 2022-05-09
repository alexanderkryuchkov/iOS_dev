//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 09.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let autorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.text = "autorLabel"
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.text = "descriptionLabel"
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.text = "likesLabel"
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.text = "viewsLabel"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCell(_ post: PostModel) {
        autorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = String(post.likes)
        viewsLabel.text = String(post.views)
    }
    
    func layout() {
        
        let insert: CGFloat = 8
        
        contentView.addSubview(mainView)
        mainView.addSubview(autorLabel)
        mainView.addSubview(postImageView)
        mainView.addSubview(descriptionLabel)
        mainView.addSubview(likesLabel)
        mainView.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            // Constraint - mainView
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Constraint - autorLabel
            autorLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: insert),
            autorLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: insert),
            autorLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -insert),
            
            // Constraint - postImageView
            postImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: insert),
            postImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            // Constraint - descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: insert),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: insert),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -insert),
            
            // Constraint - likesLabel
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: insert),
            likesLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: insert),
            likesLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            // Constraint - viewsLabel
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: insert),
            viewsLabel.trailingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: -insert),
            viewsLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -insert)
        ])
    }
}
