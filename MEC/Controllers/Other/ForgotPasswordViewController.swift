//
//  ForgotPasswordViewController.swift
//  MagicCoffeeDemo
//
//  Created by Dana Sami Abu Eid on 21/04/2024.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    let forgotPswTitle = UILabel()
    let forgotPswText = UILabel()
    let emailTextField = UITextField()
    let stackView = UIStackView()
    let nextButton = makeButton(withText: "Next")

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Style()
        layout()
    }
    
    
    func Style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        
        styleTextField(emailTextField, withText: "  Email")
        emailTextField.setIcon(.message)

        forgotPswTitle.text = "Forgot Password?"
        forgotPswTitle.font = UIFont(name: "Poppins-Medium", size: 30)
        forgotPswTitle.textColor = .drakNavy
        forgotPswTitle.numberOfLines = 0
        forgotPswTitle.textAlignment = .left
        
        
        forgotPswText.text = "Enter your email address"
        forgotPswText.font = UIFont(name: "Poppins-Regular", size: 20)
        forgotPswText.textColor = .semiGray
        forgotPswText.numberOfLines = 0
        forgotPswText.textAlignment = .left
        
    }
    
    private func styleTextField(_ textField: UITextField, withText text: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.placeholder = text
        textField.layer.cornerRadius = 8
        textField.tintColor = .navyBlue
    }
    
    func layout() {
        stackView.addArrangedSubview(forgotPswTitle)
        stackView.addArrangedSubview(forgotPswText)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(nextButton)

        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
            
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            forgotPswTitle.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            forgotPswTitle.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            forgotPswText.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            forgotPswText.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            nextButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            nextButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
        ])
    }
    
}
