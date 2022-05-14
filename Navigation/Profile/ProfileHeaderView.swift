//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit


class ProfileHeaderView: UIView {

    lazy var statusText: String = ""
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        statusTextField.placeholder = "Show status"
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false

        return statusTextField
        
    }()
    
    @objc func buttonPressed() {
        UIView.animate(withDuration: 1.5) {
            if !self.statusText.isEmpty {
                self.statusLabel.text = self.statusText
                self.statusTextField.text = ""
            }
        }
    }
    
    @objc func statusTextChanged(textField: UITextField) {
        if let newText = textField.text {
            statusText = newText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainView)
        
        [self.imageView, self.fullNameLabel, self.setStatusButton, self.statusLabel, self.statusTextField].forEach{
            mainView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // Constraint - imageView
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            // Constraint - fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),

            // Constraint - setStatusButton
            setStatusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            // Constraint - statusLabel
            statusLabel.topAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -64),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),

            // Constraint - statusTextField
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 7),
            statusTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 25),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
