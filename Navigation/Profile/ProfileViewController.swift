//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func tappAction(width: CGFloat, height: CGFloat)
}

class ProfileViewController: UIViewController {
        
    private var postModel = PostModel.makepostModel()
    private let photoModel = PhotoModel.makePhotoModel()
    
    private lazy var profileTableVIew: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        layer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func layer() {
        view.addSubview(profileTableVIew)
        
        NSLayoutConstraint.activate([
            profileTableVIew.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableVIew.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableVIew.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
        if section == 0 {
            return 1
        }else {
            return postModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            cell.setupCell(photoModel)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.delegate = self
            cell.setupCell(postModel[indexPath.row], index: indexPath.row)
            return cell
        }
    }

}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            header.delegate = self
            return header
        }else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 189
        }else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}


// MARK: - PhotosTableDelegate
extension ProfileViewController: PhotosTableDelegate {
        
    func buttonPressed() {
        self.navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
    
}


// MARK: - ProfileHeaderDelegate (отключает/включает скролл при раскрытии/закрытии аватарки)
extension ProfileViewController: ProfileHeaderDelegate {
    func tableScrollDisable() {
        profileTableVIew.isScrollEnabled = false
    }
    
    func tableScrollEnable() {
        profileTableVIew.isScrollEnabled = true
    }
}


// MARK: - ProfileHeaderDelegate
extension ProfileViewController: PostTableViewCellDelegate {
    
    func delPost(index: Int) {
        postModel.remove(at: index)
        profileTableVIew.reloadData()
    }
    
    func currentPost(autor: String, description: String, postImage: UIImage, likes: Int, views: Int) {
        let vc = CurrentPostViewController()
        vc.autorLabel.text = autor
        vc.descriptionLabel.text = description
        vc.postImageView.image = postImage
        vc.likesLabel.text = "Likes: " + String(likes)
        vc.viewsLabel.text = "Views: " + String(views)
        present(vc, animated: true)
    }

}
