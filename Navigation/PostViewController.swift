//
//  PostViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit


class PostViewController: UIViewController {

    lazy var titlePost: String = "Пост"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = titlePost
        view.backgroundColor = .green
        
        makeBarButtonItem()
    }

    private func makeBarButtonItem() {
        let barItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(buttonAction))
        navigationItem.rightBarButtonItem = barItem
    }
    
    @objc private func buttonAction() {
        let vc = InfoViewController()
        present(vc, animated: true)
    }
    
}
