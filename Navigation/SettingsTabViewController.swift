//
//  SettingsTabViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit

class SettingsTabViewController: UITabBarController {

    let userFeedVC = FeedViewController()
    let userProfileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    private func setupControllers() {
        
        let userFeedNavigationController = UINavigationController(rootViewController: userFeedVC)
        userFeedVC.tabBarItem.title = "Лента"
        userFeedVC.tabBarItem.image = UIImage(systemName: "bolt")
        userFeedVC.navigationItem.title = "Лента пользователя"
        
        let userProfileNavigationController = UINavigationController(rootViewController: userProfileVC)
        userProfileVC.tabBarItem.title = "Профиль"
        userProfileVC.tabBarItem.image = UIImage(systemName: "bolt")
        userProfileVC.navigationItem.title = "Профиль пользователя"
        
        viewControllers = [userFeedNavigationController, userProfileNavigationController]
    }
    
}
