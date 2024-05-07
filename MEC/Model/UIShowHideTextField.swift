//
//  UIShowHideTextField.swift
//  MagicCoffeeDemo
//
//  Created by Dana Sami Abu Eid on 21/04/2024.
//

import Foundation

import UIKit

class UIShowHideTextField: UITextField {

    let rightButton  = UIButton(type: .custom)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        rightButton.setImage(UIImage(named: "Show") , for: .normal)
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
        rightButton.frame = CGRect(x:0, y:0, width:30, height:30)

        rightViewMode = .always
        rightView = rightButton
        isSecureTextEntry = true
    }

    @objc
    func toggleShowHide(button: UIButton) {
        toggle()
    }

    func toggle() {
        isSecureTextEntry = !isSecureTextEntry
        if isSecureTextEntry {
            rightButton.setImage(UIImage(named: "Show") , for: .normal)
        } else {
            rightButton.setImage(UIImage(named: "Show") , for: .normal)
        }
    }

}

