//
//  InfoViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        makeButton()
    }

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Внимание!", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func buttonAction() {
        
        let alert = UIAlertController(title: "Финальное окно", message: "Последний экран", preferredStyle: .alert)
        
        let yesButton = UIAlertAction(title: "Выйти", style: .default) { _ in
            print("Домашняя работа выполнена!")
            self.dismiss(animated: true)
        }
        let cancelButton = UIAlertAction(title: "Отмена", style: .destructive)
        
        alert.addAction(cancelButton)
        alert.addAction(yesButton)
        present(alert, animated: true)
    }
}
