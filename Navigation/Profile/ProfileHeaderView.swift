//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit


protocol ProfileHeaderDelegate: AnyObject {
    
    func tableScrollDisable()
    
    func tableScrollEnable()
}

class ProfileHeaderView: UIView {
    
    weak var delegate: ProfileHeaderDelegate?
    
    lazy var statusText: String = ""
    
    private var oldXImageView = CGFloat()
    private var oldYImageView = CGFloat()

    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.image = UIImage(named: "hipsterCat")
        
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3.0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let closeImageButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        button.setImage(UIImage(systemName: "xmark.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        button.layer.frame.size = CGSize(width: 30, height: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        button.isHidden = true
        return button
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
    
    @objc func tappAction() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            
            self.oldXImageView = self.imageView.layer.position.x
            self.oldYImageView = self.imageView.layer.position.y
            
            self.imageView.layer.position = CGPoint(x: self.mainView.center.x, y: UIScreen.main.bounds.size.height / 2)
            self.imageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)

            
            self.imageView.layer.cornerRadius = 0
            self.imageView.layer.borderWidth = 0

            self.blackView.isHidden = false
            self.blackView.alpha = 0.5
            self.closeImageButton.isHidden = false

            self.mainView.isUserInteractionEnabled = false            
            self.mainView.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
            self.closeImageButton.alpha = 1
            }
        }
        
        delegate?.tableScrollDisable()

    }
    
    @objc func closeButtonPressed() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.imageView.layer.position = CGPoint(x: self.oldXImageView, y: self.oldYImageView)
            self.imageView.layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
            
            self.imageView.layer.cornerRadius = 50
            self.imageView.layer.borderWidth = 3.0

            self.blackView.alpha = 0
            self.blackView.isHidden = true

            self.mainView.isUserInteractionEnabled = true
            self.mainView.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
            self.closeImageButton.alpha = 0
            self.closeImageButton.isHidden = true

            }
        }
        
        delegate?.tableScrollEnable()
    }
    
    func setupGesture() {
        let tappGesture = UITapGestureRecognizer(target: self, action: #selector(tappAction))
        imageView.addGestureRecognizer(tappGesture)
        imageView.isUserInteractionEnabled = true
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainView)

            [self.fullNameLabel, self.setStatusButton, self.statusLabel, self.statusTextField, self.blackView, self.imageView].forEach{
                mainView.addSubview($0)
            }
        
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            //Constraint - imageView
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
            
            // Constraint - blackView
            blackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            blackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
        ])
        
        
        // Отдельно ставим кнопку закрытия фрейма (так как все другие кнопки при открытии аватара будут неактивные)
        addSubview(closeImageButton)
        
        NSLayoutConstraint.activate([
            closeImageButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeImageButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        setupGesture()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
