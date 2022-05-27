//
//  LogInViewController.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 07.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    private var rootLogin = "admin@admin.ru"
    private var rootPassword = "q12345"
    // Минимальная длина пароля
    private let minLenghtPassword = 5

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let loginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let logo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userLogin: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
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
    
    private let loginButton: UIButton = {
        
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(rgb: 0x4885CC)
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = true
        
        layer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func buttonPressed() {
        
        if let userLoginText = userLogin.text {
            if let userPasswordText = userPassword.text {

                if validationEmail(email: userLoginText) && validationPassword(password: userPasswordText){

                    if userLoginText == rootLogin && userPasswordText == rootPassword {
                        let vc = ProfileViewController()
                        self.navigationController?.pushViewController(vc, animated: true)
                    }else {
                        alerts(text: "Неправильный логин или пароль!")
                        userLogin.layer.borderColor = UIColor.red.cgColor
                        userPassword.layer.borderColor = UIColor.red.cgColor
                        userPassword.text = ""
                    }

                }
            }
        }

        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }

    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    // Метод проверки правильного email
    private func validationEmail(email: String) -> Bool {
        if email.count == 0 {
            alerts(text: "Поле логина не может быть пустым!")
            
            loginView.bringSubviewToFront(userLogin)
            userLogin.layer.borderColor = UIColor.red.cgColor
            return false
        }else {
            
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let isValid = emailPred.evaluate(with: email)
            
            if isValid {
                userLogin.layer.borderColor = UIColor.lightGray.cgColor
                return true
            }else {
                alerts(text: "Не корректно введен адрес электронной почты")
                loginView.bringSubviewToFront(userLogin)
                userLogin.layer.borderColor = UIColor.red.cgColor
                return false
            }

        }
    }
    
    // Метод проверки правильного пароля
    private func validationPassword(password: String) -> Bool{
        
        if password.count == 0 {
            alerts(text: "Поле пароля не может быть пустым!")
            loginView.bringSubviewToFront(userPassword)
            userPassword.layer.borderColor = UIColor.red.cgColor
            return false
        }else if password.count < minLenghtPassword {
            alerts(text: "Длина пароля должны быть не менее 5 символов!")
            loginView.bringSubviewToFront(userPassword)
            userPassword.layer.borderColor = UIColor.red.cgColor
            return false
        }else {
            userPassword.layer.borderColor = UIColor.lightGray.cgColor
            return true
        }
    }

    // Метод вызова уведомлений
    private func alerts(text: String) {
        
        let alertController = UIAlertController(title: "Внимание!!!", message: text, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    func layer() {

        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        loginView.addSubview(logo)
        loginView.addSubview(userLogin)
        loginView.addSubview(userPassword)
        loginView.addSubview(loginButton)

        NSLayoutConstraint.activate([
            
            // Constraint - scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            // Constraint - loginView
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Constraint - logo
            logo.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),
          
            // Constraint - userLogin
            userLogin.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            userLogin.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            userLogin.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            userLogin.heightAnchor.constraint(equalToConstant: 50),

            // Constraint - userPassword
            userPassword.topAnchor.constraint(equalTo: userLogin.bottomAnchor, constant: -1),
            userPassword.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            userPassword.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            userPassword.heightAnchor.constraint(equalToConstant: 50),
            
            // Constraint - loginButton
            loginButton.topAnchor.constraint(equalTo: userPassword.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor)
        ])

    }
    
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
