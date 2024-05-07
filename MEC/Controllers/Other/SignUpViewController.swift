//
//  SignUpViewController.swift
//  MagicCoffeeDemo
//
//  Created by Dana Sami Abu Eid on 21/04/2024.
//

import UIKit

class SignUpViewController:  UIViewController {
    
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let phoneTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let passwordCTextField = UIShowHideTextField()
    let loginButton = makeButton(withText: "Signup")
    let loginTitle = UILabel()
    let loginWelcome = UILabel()
    let forgetPswTitle = makeForgetPswButton(withText: "Already a member? Sign in")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        passwordCTextField.becomeFirstResponder()

    }
}

// MARK: - UI Setup

extension SignUpViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20


        styleTextField(emailTextField, withText: "  Email")
        styleTextField(passwordTextField, withText: "  Password")
        styleTextField(usernameTextField, withText: "Username")
        styleTextField(passwordCTextField, withText: "Password")
        styleTextField(phoneTextField, withText: "Phone Number")

        
        emailTextField.setIcon(.message)
        passwordCTextField.setIcon(.lock)
        usernameTextField.setIcon(.profile)
        phoneTextField.setIcon(.smartphone)
        
        
        loginTitle.text = "Sign up"
        loginTitle.font = UIFont(name: "Poppins-Medium", size: 30)
        loginTitle.textColor = .drakNavy
        loginTitle.numberOfLines = 0
        loginTitle.textAlignment = .left
        
        
        loginWelcome.text = "Create an account here"
        loginWelcome.font = UIFont(name: "Poppins-Regular", size: 20)
        loginWelcome.textColor = .semiGray
        loginWelcome.numberOfLines = 0
        loginWelcome.textAlignment = .left
        
    
        
    }
    
    private func styleTextField(_ textField: UITextField, withText text: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.placeholder = text
        textField.layer.cornerRadius = 8
        textField.tintColor = .navyBlue
    }
    
    // MARK: - Layout Setup

    func layout() {
        stackView.addArrangedSubview(loginTitle)
        stackView.addArrangedSubview(loginWelcome)
        //////////////
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(phoneTextField)
///////////
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordCTextField)
      //  stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(forgetPswTitle)

        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
            
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginTitle.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            loginTitle.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginWelcome.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            loginWelcome.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            usernameTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            usernameTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            phoneTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            phoneTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            passwordCTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordCTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            
            forgetPswTitle.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            forgetPswTitle.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
}


