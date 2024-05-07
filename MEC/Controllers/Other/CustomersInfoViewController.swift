//
//  CustomersInfoViewController.swift
//  MEC
//
//  Created by Dana Sami Abu Eid on 07/05/2024.
//

import UIKit

class CustomersInfoViewController: UIViewController {

    weak var delegate: SaveCustomerViewControllerDelegate?
      
      let textField: UITextField = {
          let textField = UITextField()
          textField.translatesAutoresizingMaskIntoConstraints = false
          textField.font = UIFont.preferredFont(forTextStyle: .body)
          textField.textAlignment = .center
          textField.backgroundColor = .systemGray

          return textField
      }()

      lazy var saveButton: UIButton = {
          let button = makeButton(withText: "Save")
          button.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
          button.addTarget(self, action: #selector(saveButtonPressed), for: .primaryActionTriggered)

          return button
      }()

      lazy var cancelButton: UIButton = {
          let button = makeButton(withText: "Cancel")
          button.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
          button.addTarget(self, action: #selector(cancelButtonPressed), for: .primaryActionTriggered)

          return button
      }()

      override func viewDidLoad() {
          super.viewDidLoad()
          setupViews()
          layout()
      }

      func setupViews() {
          navigationItem.title = "Add Game"
          view.backgroundColor = .systemGreen
      }

      func layout() {
          let rootStackView = makeVerticalStackView()

          let buttonStackView = makeHorizontalStackView()
          buttonStackView.addArrangedSubview(saveButton)
          buttonStackView.addArrangedSubview(cancelButton)

          rootStackView.addArrangedSubview(textField)
          rootStackView.addArrangedSubview(buttonStackView)

          view.addSubview(rootStackView)

          saveButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor, multiplier: 1).isActive = true
          textField.heightAnchor.constraint(equalTo: saveButton.heightAnchor, multiplier: 1).isActive = true
          textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true

          rootStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
          rootStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      }

      // MARK: - Actions

      @objc
      func saveButtonPressed() {
          guard let customer = textField.text else { return }
          delegate?.add(Customer: "")

          dismiss(animated: true, completion: nil)
      }

      @objc
      func cancelButtonPressed() {
          dismiss(animated: true, completion: nil)
      }
  }
