//
//  CustShowInfoViewController.swift
//  MEC
//
//  Created by Dana Sami Abu Eid on 08/05/2024.
//

import UIKit
import Alamofire


class CustomerInfoViewController: UIViewController {
    
    var customer: Customer?
    
    let person = UIImage(systemName: "person.fill")
    let location = UIImage(systemName: "location.fill")
    
    let panel = UIImage(systemName: "light.panel")
    let arrow = UIImage(systemName: "arrow.up.arrow.down.square")
    
    let label = UILabel()
    let verticalStack = UIStackView()
    let horizantalStack = UIStackView()
    let customerName = UITextField()
    let customerLocation = UITextField()
    let elevatorType = UITextField()
    let controlPanelType = UITextField()
    let editeCustButton = makeButton(withText: "Edit customer")
    let DeleteCustButton = makeButton(withText: "Delete customer")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.toolbar.tintColor = .navyBlue
        
        Layout()
        Style()
        
        if let customer = customer {
            displayCustomerInfo(customer)
        }
        
        editeCustButton.addTarget(self, action: #selector(editCustomerButtonTapped), for: .touchUpInside)
        
        
    }
    
    private func styleTextField(_ textField: UITextField, withText text: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lighterGray
        textField.placeholder = text
        textField.layer.cornerRadius = 8
        textField.tintColor = .navyBlue
        textField.textColor = .drakNavy
        textField.keyboardAppearance = .default
        
    }
    
    
}

extension CustomerInfoViewController {
    
    
    func Style() {
        
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 30
        
        
        horizantalStack.axis = .horizontal
        horizantalStack.spacing = 5
        horizantalStack.alignment = .fill
        horizantalStack.distribution = .fillEqually
        
        styleTextField(customerName, withText: "Customer Name")
        styleTextField(customerLocation, withText: "Customer Location")
        styleTextField(elevatorType, withText: "Elevator Type")
        styleTextField(controlPanelType, withText: "Control Panel Type")
        
        customerName.setIcon(person!)
        customerLocation.setIcon(location!)
        elevatorType.setIcon(arrow!)
        controlPanelType.setIcon(panel!)
        
        
        
        label.text = "Customer Info"
        label.font = UIFont(name: "Poppins-Medium", size: 30)
        label.textColor = .drakNavy
        label.numberOfLines = 0
        label.textAlignment = .center
        
    }
    
    func Layout() {
        
        verticalStack.addArrangedSubview(label)
        verticalStack.addArrangedSubview(customerName)
        verticalStack.addArrangedSubview(customerLocation)
        verticalStack.addArrangedSubview(elevatorType)
        verticalStack.addArrangedSubview(controlPanelType)
        
        horizantalStack.addArrangedSubview(editeCustButton)
        horizantalStack.addArrangedSubview(DeleteCustButton)
        
        verticalStack.addArrangedSubview(horizantalStack)
        
        
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
            
            
            horizantalStack.widthAnchor.constraint(equalTo: customerName.widthAnchor),
            horizantalStack.heightAnchor.constraint(equalTo: customerName.heightAnchor),
            
            
        ])
        
        
        
        
    }
    
    
    func displayCustomerInfo(_ customer: Customer) {
        customerName.text = customer.customerName
        customerLocation.text = customer.customerLocation
        elevatorType.text = customer.customerElevatorType
        controlPanelType.text = customer.customerPanelElevator
    }
    
}

extension CustomerInfoViewController {
    
    private func updateCustomerInfo() {
        guard var customer = customer,
              let name = customerName.text,
              let location = customerLocation.text,
              let elevatorType = elevatorType.text,
              let panelType = controlPanelType.text else {
            return
        }
        
        // Update the customer object with new info
        customer.customerName = name
        customer.customerLocation = location
        customer.customerElevatorType = elevatorType
        customer.customerPanelElevator = panelType
        
        // Perform the PUT request using Alamofire
        AF.request("http://34.234.65.167:8080/api/v1/customersManagement/editCustomer/\(name)/\(location)/\(panelType)/\(elevatorType)",
                   method: .put)
        .response { response in
            switch response.result {
            case .success:
                //     print("Customer info updated successfully")
                let alert = UIAlertController(title: "Success", message: "Customer edited successfully.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
            case .failure(let error):
                print("Error: \(error)")
                let alert = UIAlertController(title: "Error", message: "Failed to Edit customer. Please try again later.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    @objc func editCustomerButtonTapped() {
        updateCustomerInfo()
    }
    
    
}
