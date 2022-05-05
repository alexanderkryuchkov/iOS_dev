//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let screenSize = UIScreen.main.bounds.size

    // Создайте экземпляр класса ProfileHeaderView в классе ProfileViewController, добавьте его в качестве subview и в методе viewWillLayoutSubviews() задайте ему frame, равный frame корневого view.

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        
    }
    
    override func viewWillLayoutSubviews() {
        let profileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 60, width: screenSize.width, height: (screenSize.height - 100) ))

        view.addSubview(profileHeaderView)
        
        profileHeaderView.addSubview(profileHeaderView.imageView)
        profileHeaderView.addSubview(profileHeaderView.titleLabel)
        profileHeaderView.addSubview(profileHeaderView.commentLabel)
        profileHeaderView.addSubview(profileHeaderView.showStatusButton)
        profileHeaderView.addSubview(profileHeaderView.statusTextField)
        
        print("Разница высоты \(Int(profileHeaderView.commentLabel.frame.maxY - profileHeaderView.showStatusButton.frame.minY))")
    }

}
