//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit


struct Post {
    var title: String
}

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton()
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.backgroundColor = .systemGray3
            button.setTitle("First", for: .normal)
        
            button.layer.cornerRadius = 2
            button.layer.shadowOffset.width = 2
            button.layer.shadowOffset.height = 2
            button.layer.shadowRadius = 2
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.5
        
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.backgroundColor = .systemGray2
            button.setTitle("Second", for: .normal)
        
            button.layer.cornerRadius = 4
            button.layer.shadowOffset.width = 4
            button.layer.shadowOffset.height = 4
            button.layer.shadowRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7
        
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
    }()
    
    
    @objc private func buttonAction() {
        let vc = PostViewController()
        vc.titlePost = post.title
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        makeLayout()

    }

    
    private func makeLayout() {
        
        view.addSubview(stackView)

        [firstButton, secondButton].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            firstButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            secondButton.widthAnchor.constraint(equalToConstant: 100),
            secondButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
