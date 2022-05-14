//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        return view
    }()
    
    let screenSize = UIScreen.main.bounds.size

    // Создайте экземпляр класса ProfileHeaderView в классе ProfileViewController, добавьте его в качестве subview и в методе viewWillLayoutSubviews() задайте ему frame, равный frame корневого view.

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        self.profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame

    }
}
