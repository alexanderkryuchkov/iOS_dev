//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit


class ProfileHeaderView: UIView {

    lazy var statusText: String = ""
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.image = UIImage(named: "hipsterCat")
        
        // с этими разобраться
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3.0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let fullNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Hipster cat"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let statusLabel: UILabel = {
        let view = UILabel()
        view.text = "Waiting fot something..."
        view.textColor = UIColor.gray
        view.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    let setStatusButton: UIButton = {
        
        let button = UIButton()
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        
        button.layer.cornerRadius = 4
        
        button.setTitle("Show status", for: .normal)
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let statusTextField: UITextField = {
        
        let statusTextField = UITextField()
                
        statusTextField.backgroundColor = .white
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1.0
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false

        return statusTextField
        
    }()
    
    
    let setTitleButton: UIButton = {
        
        let button = UIButton()
        
        button.addTarget(self, action: #selector(buttonTitlePressed), for: .touchUpInside)
        button.backgroundColor = .systemGray2
        button.setTitle("Change title", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonPressed() {
        UIView.animate(withDuration: 1.5) {
            if !self.statusText.isEmpty {
                self.statusLabel.text = self.statusText
                self.statusTextField.text = ""
            }
        }
        print("2")
    }
    
    
    @objc func statusTextChanged(textField: UITextField) {
        if let newText = textField.text {
            statusText = newText
        }
    }
    
    
    @objc func buttonTitlePressed() {
        if !self.statusText.isEmpty {
            self.fullNameLabel.text = self.statusText
            self.statusTextField.text = ""
        }
        print("3")

    }
    

}
