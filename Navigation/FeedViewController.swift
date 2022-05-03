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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        makePostButton()

    }

    private func makePostButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Читать пост", for: .normal)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func buttonAction() {
        let vc = PostViewController()
        vc.titlePost = post.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
