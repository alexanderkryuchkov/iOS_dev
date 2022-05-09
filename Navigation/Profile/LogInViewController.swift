//
//  LogInViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 07.05.2022.
//

import UIKit

class LogInViewController: UIViewController {

    let loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = true
        layer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func layer() {
        
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        loginView.addSubview(loginView.logo)
        loginView.addSubview(loginView.userLogin)
        loginView.addSubview(loginView.userPassword)
        loginView.addSubview(loginView.loginButton)
        
        NSLayoutConstraint.activate([
            loginView.logo.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            loginView.logo.topAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.topAnchor, constant: 120),
            loginView.logo.widthAnchor.constraint(equalToConstant: 100),
            loginView.logo.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            loginView.userLogin.topAnchor.constraint(equalTo: loginView.logo.bottomAnchor, constant: 120),
            loginView.userLogin.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            loginView.userLogin.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            loginView.userLogin.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            loginView.userPassword.topAnchor.constraint(equalTo: loginView.userLogin.bottomAnchor, constant: -1),
            loginView.userPassword.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            loginView.userPassword.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            loginView.userPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            loginView.loginButton.topAnchor.constraint(equalTo: loginView.userPassword.bottomAnchor, constant: 16),
            loginView.loginButton.leadingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginView.loginButton.trailingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

}
