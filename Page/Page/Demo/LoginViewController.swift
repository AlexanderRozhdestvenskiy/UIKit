//
//  LoginViewController.swift
//  Page
//
//  Created by Alexander Rozhdestvenskiy on 17.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let stackView = UIStackView()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = makeButton(text: "Login")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        styleTextField(textField: emailTextField, text: "   Email")
        styleTextField(textField: passwordTextField, text: "   Password")
    }
    
    func layout() {
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor).isActive = true
        
        loginButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor).isActive = true
    }
    
    private func styleTextField(textField: UITextField, text: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.placeholder = text
        textField.layer.cornerRadius = 8
    }
}

func makeButton(text: String) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.configuration = .filled()
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 8
    return button
}
