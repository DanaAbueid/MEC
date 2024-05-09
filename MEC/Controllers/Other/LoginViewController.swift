//
//  LoginViewController.swift
//  SimpleOnboardingDemo
//
//  Created by jrasmusson on 2021-01-09.
//

import UIKit

class LoginViewController: UIViewController {
    
 //   let buttonSetup = makeButton(withText: "")
    let stackView = UIStackView()
    let horizonStackView = UIStackView()

    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = makeButton(withText: "Login")
    let loginTitle = UILabel()
    let loginWelcome = UILabel()
    let rememberLabel = UILabel()
    let rememberSwitch = UISwitch()
    let forgetPswTitle = makeForgetPswButton(withText: "Forgot Password?")
    let signUpButton = makeForgetPswButton(withText: "Sign Up")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

// MARK: - UI Setup

extension LoginViewController {
    
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        
        horizonStackView.axis = .horizontal
        horizonStackView.spacing = 15
        horizonStackView.alignment = .center
        horizonStackView.distribution = .fillEqually


        styleTextField(emailTextField, withText: "  Email")
        styleTextField(passwordTextField, withText: "  Password")
        emailTextField.setIcon(.message)
        passwordTextField.setIcon(.lock)
        
        rememberLabel.text = "Remember Me"
        rememberLabel.font = UIFont(name: "Poppins-Regular", size: 17)
        rememberLabel.textColor = .drakNavy
        rememberLabel.textAlignment = .center
        rememberLabel.numberOfLines = 0

        
        
        loginTitle.text = "Login"
        loginTitle.font = UIFont(name: "Poppins-Medium", size: 30)
        loginTitle.textColor = .drakNavy
        loginTitle.numberOfLines = 0
        loginTitle.textAlignment = .left
        
        rememberSwitch.onTintColor = .navyBlue
        
        loginWelcome.text = "Welcome Back!"
        loginWelcome.font = UIFont(name: "Poppins-Regular", size: 20)
        loginWelcome.textColor = .semiGray
        loginWelcome.numberOfLines = 0
        loginWelcome.textAlignment = .left
        
        forgetPswTitle.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)

        
    }

    
    private func styleTextField(_ textField: UITextField, withText text: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.placeholder = text
        textField.layer.cornerRadius = 8
        textField.tintColor = .navyBlue
        
    }
    
    // MARK: - UI Setup

    @objc func forgetPasswordTapped() {
        let ForgotVC = ForgotPasswordViewController() // Instantiate your SignUpViewController
        navigationController?.pushViewController(ForgotVC, animated: true) // Push SignUpViewController onto the navigation stack
    }
    
    @objc func loginsTapped() {
        let signUpVC = CustomersViewController() // Instantiate your SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true) // Push SignUpViewController onto the navigation stack
    }
    
    @objc func loginTapped() {
        // Instantiate the CustomersViewController
        let TabBarVC = TabBarViewController()
        
        navigationController?.pushViewController(TabBarVC, animated: true)
        
         }
    
    
    @objc func signUpTapped() {
        let signUpVC = SignUpViewController() // Instantiate your SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true) // Push SignUpViewController onto the navigation stack
    }


    
    // MARK: - Layout Setup

    func layout() {
        
        stackView.addArrangedSubview(loginTitle)
        stackView.addArrangedSubview(loginWelcome)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        horizonStackView.addArrangedSubview(rememberLabel)
        horizonStackView.addArrangedSubview(rememberSwitch)
        
        stackView.addArrangedSubview(horizonStackView)
        stackView.addArrangedSubview(loginButton)
        
        stackView.addArrangedSubview(forgetPswTitle)

       // stackView.addArrangedSubview(signUpButton)

        
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
            
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            
            horizonStackView.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            horizonStackView.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
  
            
            
            forgetPswTitle.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            forgetPswTitle.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
}



