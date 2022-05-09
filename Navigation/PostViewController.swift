//
//  PostViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit


class PostViewController: UIViewController {

    var titlePost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = titlePost?.title
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
