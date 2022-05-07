//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        layer()
    }
    
    func layer() {
        
//        view.addSubview(profileHeaderView)
        
//        NSLayoutConstraint.activate([
//            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
//        ])
//
        view.addSubview(profileHeaderView.imageView)
        view.addSubview(profileHeaderView.fullNameLabel)
        view.addSubview(profileHeaderView.setStatusButton)
        view.addSubview(profileHeaderView.statusLabel)
        view.addSubview(profileHeaderView.statusTextField)
        view.addSubview(profileHeaderView.setTitleButton)
        
        NSLayoutConstraint.activate([
            profileHeaderView.imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileHeaderView.imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeaderView.imageView.widthAnchor.constraint(equalToConstant: 100),
            profileHeaderView.imageView.heightAnchor.constraint(equalToConstant: 100)

        ])
        

        NSLayoutConstraint.activate([
            profileHeaderView.fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileHeaderView.fullNameLabel.leadingAnchor.constraint(equalTo: profileHeaderView.imageView.trailingAnchor, constant: 16)
        ])


        NSLayoutConstraint.activate([
            profileHeaderView.setStatusButton.topAnchor.constraint(equalTo: profileHeaderView.imageView.bottomAnchor, constant: 16),
            profileHeaderView.setStatusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeaderView.setStatusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileHeaderView.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            profileHeaderView.statusLabel.topAnchor.constraint(equalTo: profileHeaderView.setStatusButton.topAnchor, constant: -64),
            profileHeaderView.statusLabel.leadingAnchor.constraint(equalTo: profileHeaderView.fullNameLabel.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            profileHeaderView.statusTextField.topAnchor.constraint(equalTo: profileHeaderView.statusLabel.bottomAnchor, constant: 7),
            profileHeaderView.statusTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileHeaderView.statusTextField.heightAnchor.constraint(equalToConstant: 25),
            profileHeaderView.statusTextField.leadingAnchor.constraint(equalTo: profileHeaderView.fullNameLabel.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            profileHeaderView.setTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.setTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.setTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileHeaderView.setTitleButton.heightAnchor.constraint(equalToConstant: 50)
        ])

    }

}
