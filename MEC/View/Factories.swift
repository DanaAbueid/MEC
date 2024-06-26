//
//  Factories.swift
//  DemoArcade
//
//  Created by Jonathan Rasmusson Work Pro on 2020-02-02.
//  Copyright © 2020 Rasmusson Software Consulting. All rights reserved.
//

import UIKit

// MARK: - Image Setup

func makeSymbolImage(systemName: String) -> UIImage? {
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: systemName, withConfiguration: configuration)

    return image
}

// MARK: - Button Setup


func makeButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.backgroundColor = .navyBlue
    button.layer.cornerRadius = 8
    button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
    return button
}

func makeSymbolButton(systemName: String, target: Any, selector: Selector) -> UIButton {
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: systemName, withConfiguration: configuration)

    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(target, action: selector, for: .primaryActionTriggered)
    button.setImage(image, for: .normal)
    button.imageView?.contentMode = .scaleAspectFit

    return button
}

func makeSpotifyButton(withText title: String) -> UIButton {
    let button = UIButton()
    let buttonHeight: CGFloat = 40
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.minimumScaleFactor = 0.5
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.backgroundColor = .cyan
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = buttonHeight / 2
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: buttonHeight, bottom: 10, right: buttonHeight)

    let attributedText = NSMutableAttributedString(string: title, attributes: [
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.kern: 2
        ])

    button.setAttributedTitle(attributedText, for: .normal)

    return button
}


func makeForgetPswButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.layer.cornerRadius = 8
    button.backgroundColor = .clear
    button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
    button.setTitleColor(.navyBlue, for: .normal)
    
    return button
}

// MARK: - Label Setup


func makeLabel() -> UILabel {
    return makeLabel(withTitle: "")
}

func makeLabel(withTitle title: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = title
    label.textAlignment = .center
    label.textColor = .black
    label.numberOfLines = 0
    label.adjustsFontSizeToFitWidth = true

    return label
}

// MARK: - orizontalStack Setup


func makeHorizontalStackView() -> UIStackView {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.spacing = 8.0

    return stack
}

// MARK: - VerticalStack Setup


func makeVerticalStackView() -> UIStackView {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 8.0

    return stack
}

// MARK: - TextField Icon Setup

extension UITextField {
    
    
    func setIcon (_ image : UIImage) {
        let iconView = UIImageView(frame:
                                    CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 20, y: 0, width: 50, height: 35))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
}
    
// MARK: - Tabel cell setup

func setTable(_ table: UITableView)  {
    
  //  table.layer.cornerRadius = 8
    table.clipsToBounds = true
    table.separatorStyle = .none
    table.rowHeight = 80
//    table.contentInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
    table.tintColor = .drakNavy
    table.backgroundColor = .appWhite
    
}

func setCell (_ cell: UITableViewCell, WithText text: String?) {
    
    cell.layer.cornerRadius = 15
  //  cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = .lighterGray
    cell.tintColor = .drakNavy
    cell.textLabel?.textColor = .drakNavy
    cell.textLabel?.text = text
    cell.layer.borderColor = UIColor.white.cgColor
    cell.clipsToBounds = true
   cell.layer.borderWidth = 3.0
    let disclosureIndicatorView = UIImageView(image: UIImage(systemName: "chevron.right"))
    disclosureIndicatorView.tintColor = .drakNavy // Set your desired color
  //  disclosureIndicatorView.backgroundColor = .lighterGray
     cell.accessoryView = disclosureIndicatorView
}

func setVerticalStack(withStack stack: UIStackView, withSpacing space: CGFloat) {
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .fill
    stack.spacing = space
    
}

func setSearchBar (_ searchBar: UISearchBar){
    
    searchBar.barTintColor = .appWhite
    if let leftView = searchBar.searchTextField.leftView as? UIImageView {
        leftView.tintColor = .drakNavy // Change the color to your desired color
    }

    searchBar.searchTextField.backgroundColor = .lighterGray
    searchBar.searchTextField.textColor = .drakNavy
    searchBar.tintColor = .drakNavy
   
    
}
