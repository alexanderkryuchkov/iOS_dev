//
//  CurrentPostViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 27.05.2022.
//

import UIKit

class CurrentPostViewController: UIViewController {

    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let autorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.text = "autorLabel"
        label.numberOfLines = 2
        return label
    }()
    
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.text = "descriptionLabel"
        return label
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.text = "likesLabel"
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.text = "viewsLabel"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        layout()
    }
    
    func layout() {
        
        let insert: CGFloat = 8
        
        view.addSubview(mainView)
        mainView.addSubview(autorLabel)
        mainView.addSubview(postImageView)
        mainView.addSubview(descriptionLabel)
        mainView.addSubview(likesLabel)
        mainView.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            // Constraint - mainView
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Constraint - autorLabel
            autorLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: insert),
            autorLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: insert),
            autorLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -insert),
            
            // Constraint - postImageView
            postImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 400),
            
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
        ])
    }


}
