//
//  PostViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit


class PostViewController: UIViewController {

    var titlePost: String = "Пост"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = titlePost
        view.backgroundColor = .green
    }

}
