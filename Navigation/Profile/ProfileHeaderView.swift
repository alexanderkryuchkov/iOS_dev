//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 03.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = "Waiting fot something..."
    
    private lazy var imageView: UIImageView = {

        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        imageView.image = UIImage(named: "hipsterCat")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3.0
        return imageView

    }()
    
    private lazy var titleLabel: UILabel = {
        
        // Задаем переменные и координаты
        let titleLabelX = Int(UIScreen.main.bounds.width / 2 - 50)
        let titleLabelY = 27
        let titleLabelWidth = 200
        let titleLabelHeight = 30
        
        let titleLabel = UILabel(frame: CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelWidth, height: titleLabelHeight))
        titleLabel.text = "Hipster Car"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        return titleLabel
    
    }()

    private lazy var commentLabel: UILabel = {
        
        // Задаем переменные и координаты
        let commentLabelX = Int(UIScreen.main.bounds.width / 2 - 50)
        let commentLabelY = Int(self.showStatusButton.frame.minY - 64)
        let commentLabelWidth = 200
        let commentLabelHeight = 30
        
        let commentLabel = UILabel(frame: CGRect(x: commentLabelX, y: commentLabelY, width: commentLabelWidth, height: commentLabelHeight))
        commentLabel.text = "Waiting fot something..."
        commentLabel.textColor = UIColor.gray
        commentLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        return commentLabel
        
    }()
    
    private lazy var showStatusButton: UIButton = {
        
        // Задаем переменные и координаты
        let buttonX = 16
        let buttonY = Int(self.imageView.frame.maxY + 16)
        let buttonWidth = Int(UIScreen.main.bounds.width - 32)
        let buttonHeight = 50
        
        let button = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight))
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        
        //!!!!!!! ВНИМАНИЕ:
        // не могу понять. Выставил как по заданию радиус cornerRadius = 4, а закругление не соответствует картинке. Чтобы соответствовало картинке надо выставлять 16. Я оставил как по ДЗ.
        button.layer.cornerRadius = 4
        
        button.setTitle("Show status", for: .normal)
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        
        // Задаем переменные и координаты
        let textFieldX = Int(self.commentLabel.frame.minX)
        let textFieldY = Int(self.showStatusButton.frame.minY - 32)
        let textFieldWidth = Int(Int(UIScreen.main.bounds.width) - textFieldX - 16)
        let textFieldHeight = 25
        
        let statusTextField = UITextField(frame: CGRect(x: textFieldX, y: textFieldY, width: textFieldWidth, height: textFieldHeight))
                
        statusTextField.backgroundColor = .white
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1.0
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)

        return statusTextField
        
    }()
    
    @objc private func buttonPressed() {
        UIView.animate(withDuration: 1.5) {
            self.commentLabel.text = self.statusText
        }

    }
    
    @objc private func statusTextChanged(textField: UITextField) {
        if let newText = textField.text {
            statusText = newText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [self.imageView, self.titleLabel, self.commentLabel, self.showStatusButton, self.statusTextField].forEach{
            self.addSubview($0)
        }

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
