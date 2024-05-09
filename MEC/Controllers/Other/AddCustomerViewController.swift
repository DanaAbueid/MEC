//
//  CustomersInfoViewController.swift
//  MEC
//
//  Created by Dana Sami Abu Eid on 07/05/2024.
//

import UIKit
import Alamofire

class AddCustomerViewController: UIViewController {

    weak var delegate: SaveCustomerViewControllerDelegate?
    
    var customer: Customer?
    
    let person = UIImage(systemName: "person.fill")
    let location = UIImage(systemName: "location.fill")
    
    let panel = UIImage(systemName: "light.panel")
    let arrow = UIImage(systemName: "arrow.up.arrow.down.square")
    
    let label = UILabel()
    let verticalStack = UIStackView()
    let customerName = UITextField()
    let customerLocation = UITextField()
    let elevatorType = UITextField()
    let controlPanelType = UITextField()
    let addCustButton = makeButton(withText: "Add customer")
    var cancelButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray5
        setupViews()
        Style()
        Layout()
    }

    func setupViews() {
        cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationController?.toolbar.tintColor = .navyBlue
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    private func styleTextField(_ textField: UITextField, withText text: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lighterGray
        textField.placeholder = text
        textField.layer.cornerRadius = 8
        textField.tintColor = .navyBlue
        textField.textColor = .drakNavy
        textField.keyboardAppearance = .default
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.drakNavy ])
    }
    
    func Style() {
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 30

        styleTextField(customerName, withText: "Customer Name")
        styleTextField(customerLocation, withText: "Customer Location")
        styleTextField(elevatorType, withText: "Elevator Type")
        styleTextField(controlPanelType, withText: "Control Panel Type")

        customerName.setIcon(person!)
        customerLocation.setIcon(location!)
        elevatorType.setIcon(arrow!)
        controlPanelType.setIcon(panel!)

        label.text = "Add New Customer"
        label.font = UIFont(name: "Poppins-Medium", size: 30)
        label.textColor = .drakNavy
        label.numberOfLines = 0
        label.textAlignment = .center
        
        addCustButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    func Layout() {
        verticalStack.addArrangedSubview(label)
        verticalStack.addArrangedSubview(customerName)
        verticalStack.addArrangedSubview(customerLocation)
        verticalStack.addArrangedSubview(elevatorType)
        verticalStack.addArrangedSubview(controlPanelType)
                
        verticalStack.addArrangedSubview(addCustButton)
   
        view.addSubview(verticalStack)
        
        NSLayoutConstraint.activate([
            verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customerName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            customerName.heightAnchor.constraint(equalToConstant: 60),
            label.widthAnchor.constraint(equalTo: customerName.widthAnchor),
            label.heightAnchor.constraint(equalTo: customerName.heightAnchor),
            customerLocation.widthAnchor.constraint(equalTo: customerName.widthAnchor),
            customerLocation.heightAnchor.constraint(equalTo: customerName.heightAnchor),
            elevatorType.widthAnchor.constraint(equalTo: customerName.widthAnchor),
            elevatorType.heightAnchor.constraint(equalTo: customerName.heightAnchor),
            controlPanelType.widthAnchor.constraint(equalTo: customerName.widthAnchor),
            controlPanelType.heightAnchor.constraint(equalTo: customerName.heightAnchor),
            addCustButton.widthAnchor.constraint(equalTo: customerName.widthAnchor),
            addCustButton.heightAnchor.constraint(equalTo: customerName.heightAnchor),
        ])
    }

    // MARK: - Actions

    @objc func saveButtonPressed() {
        guard let name = customerName.text,
              let location = customerLocation.text,
              let elevatorType = elevatorType.text,
              let panelType = controlPanelType.text else {
            return
        }

        let newCustomer = Customer(customerId: 0,
                                   customerName: name,
                                   customerLocation: location,
                                   customerElevatorType: elevatorType,
                                   customerPanelElevator: panelType,
                                   tasks: [])

        // Perform the POST request asynchronously
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            
            AF.request("http://34.234.65.167:8080/api/v1/customersManagement/addNewCus",
                       method: .post,
                       parameters: newCustomer,
                       encoder: JSONParameterEncoder.default)
                .response { response in
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        
                        switch response.result {
                        case .success:
                            let alert = UIAlertController(title: "Success", message: "Customer added successfully.", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                                self.dismiss(animated: true, completion: nil)
                            }
                            alert.addAction(okAction)
                            self.present(alert, animated: true, completion: nil)
                        case .failure(let error):
                            print("Error: \(error)")
                            let alert = UIAlertController(title: "Error", message: "Failed to add customer. Please try again later.", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alert.addAction(okAction)
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
            }
        }
    }

    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}
