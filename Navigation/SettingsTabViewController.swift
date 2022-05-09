//
//  SettingsTabViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit

class SettingsTabViewController: UITabBarController {

    let userFeedVC = FeedViewController()
    let userProfileVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    private func setupControllers() {
        
        let userFeedNavigationController = UINavigationController(rootViewController: userFeedVC)
        userFeedVC.tabBarItem.title = "Feed"
        userFeedVC.tabBarItem.image = UIImage(systemName: "house")
        userFeedVC.navigationItem.title = "Лента пользователя"
        
        let userProfileNavigationController = UINavigationController(rootViewController: userProfileVC)
        userProfileVC.tabBarItem.title = "Profile"
        userProfileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        userProfileVC.navigationItem.title = "Профиль пользователя"
        
        viewControllers = [userFeedNavigationController, userProfileNavigationController]
    }
    
}
