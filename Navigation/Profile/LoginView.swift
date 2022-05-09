//
//  LoginView.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 07.05.2022.
//

import UIKit

class LoginView: UIView {

    let logo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userLogin: UITextField = {
        let view = UITextField()
        view.backgroundColor = .systemGray6
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        // tintcolor!!!
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16)
        view.autocapitalizationType = .none
        view.placeholder = "Email or phone"
        
        view.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: view.frame.height))
        view.leftViewMode = .always
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let userPassword: UITextField = {
        let view = UITextField()
        view.backgroundColor = .systemGray6
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16)
        view.autocapitalizationType = .none
        view.isSecureTextEntry = true
        view.placeholder = "Password"
        
        view.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: view.frame.height))
        view.leftViewMode = .always
                
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let loginButton: UIButton = {
        
        let button = UIButton()
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        button.backgroundImage(for: "blue_pixel")
//        button.backgroundImage(for: UIColor(patternImage: UIImage(named: "logo")))
//        let colorButton = hexStringToUIColor(hex: "#4885CC")
        
//        button.setBackgroundImage(UIImage.init(named: "blue_pixel"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFill
//
//        button.backgroundColor = .accencol
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonPressed() {
//        let vc = ProfileViewController()
//        vc.titlePost = post.title
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
