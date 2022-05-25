//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 09.05.2022.
//

import UIKit


protocol PostTableViewCellDelegate: AnyObject {
        
}

    
class PostTableViewCell: UITableViewCell {
    
    weak var delegate: PostTableViewCellDelegate?

    private var likes: Int = 0
    private var views: Int = 0

    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let autorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.text = "autorLabel"
        label.numberOfLines = 2
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
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.text = "descriptionLabel"
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.text = "likesLabel"
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.text = "viewsLabel"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCell(_ post: PostModel) {
        autorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likes = post.likes
        likesLabel.text = "Likes: " + String(likes)
        views = post.views
        viewsLabel.text = "Views: " + String(views)
    }
    
    func setupGesture() {
        let likesTapGesture = UITapGestureRecognizer(target: self, action: #selector(likesTapAction))
        likesLabel.addGestureRecognizer(likesTapGesture)
        likesLabel.isUserInteractionEnabled = true
        
        let viewsTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTapAction))
        postImageView.addGestureRecognizer(viewsTapGesture)
        postImageView.isUserInteractionEnabled = true
    }

    @objc func likesTapAction() {
        likes += 1
        likesLabel.text = "Likes: " + String(likes)
    }
    
    @objc func viewsTapAction() {
        views += 1
        viewsLabel.text = "Views: " + String(views)
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
            postImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Constraint - descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: insert),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: insert),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -insert),
            
            // Constraint - likesLabel
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: insert),
            likesLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: insert),
            
            // Constraint - viewsLabel
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: insert),
            viewsLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -insert),
            viewsLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -insert)
        ])
    }
}
