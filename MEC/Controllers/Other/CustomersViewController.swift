//
//  CustomersViewController.swift
//  MEC
//
//  Created by Dana Sami Abu Eid on 30/04/2024.
//

import UIKit
import Alamofire

class CustomersViewController: UIViewController {
    
    let stackView = UIStackView()
    let searchBar = UISearchBar()
    var customerTable = UITableView()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let cellId = "insertCellId"
    var addNewCustomerButton: UIBarButtonItem!
    var reloadTableButton: UIBarButtonItem!
    
    
    var customers: [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //setting Navigation bar
        navigationItem.title = "Customers"
        navigationController?.toolbar.tintColor = .navyBlue
        activityIndicator.color = .drakNavy
        addNewCustomerButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewCustomerTapped))
        reloadTableButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadButtonTapped))
        navigationItem.rightBarButtonItem = addNewCustomerButton
        navigationItem.leftBarButtonItem = reloadTableButton
        
        //setting UI
        Style()
        layout()
        
        //Setting table view
        customerTable.delegate = self
        customerTable.dataSource = self
        customerTable.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        
        // Add activity indicator
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        customerTable.isUserInteractionEnabled = false
        
        // Fetch customers from API
        fetchCustomers()
        customerTable.reloadData()
        
        
        
    }
    
    // MARK: - UI Setup
    
    func Style() {
        
        setTable(customerTable)
        setVerticalStack(withStack: stackView, withSpacing: 0)
        setSearchBar(searchBar)
        
    }
    
    // MARK: - Layout Setup
    
    func layout() {
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(customerTable)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc func addNewCustomerTapped() {
        
        let CustomerInfoVC = AddCustomerViewController()
        present(CustomerInfoVC, animated: true, completion: nil)
        //  navigationController?.pushViewController(CustomerInfoVC, animated: true)
        
    }
    
    @objc func reloadButtonTapped() {
        fetchCustomers()
        customerTable.reloadData()
        
    }
    
    // MARK: - Fetch Customers
    
    func fetchCustomers() {
        DispatchQueue.global().async {
            AF.request("http://34.234.65.167:8080/api/v1/customersManagement/customers")
                .responseDecodable(of: [Customer].self) { response in
                    DispatchQueue.main.async {
                        switch response.result {
                        case .success(let fetchedCustomers):
                            self.customers = fetchedCustomers
                            self.customerTable.reloadData()
                            self.activityIndicator.stopAnimating()
                            // Enable user interaction on table view
                            self.customerTable.isUserInteractionEnabled = true
                        case .failure(let error):
                            print("Error: \(error)")
                            self.activityIndicator.stopAnimating()
                            // Enable user interaction on table view
                            self.customerTable.isUserInteractionEnabled = true
                            let alert = UIAlertController(title: "Error", message: "Failed to add customer. Please try again later.", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alert.addAction(okAction)
                        }
                    }
                }
        }
    }
}

// MARK: - TableView Setup

extension CustomersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let customer = customers[indexPath.row]
        cell.textLabel?.text = customer.customerName
        setCell(cell, WithText: customer.customerName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.customers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        action.image = makeSymbolImage(systemName: "trash")
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Retrieve the selected customer
        let selectedCustomer = customers[indexPath.row]
        
        // Show the customer info in a new view controller
        let customerInfoVC = CustomerInfoViewController()
        customerInfoVC.customer = selectedCustomer // Pass the selected customer to the next view controller
        navigationController?.pushViewController(customerInfoVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//    
    // MARK: - TableView Delegate
    
    
}

extension CustomersViewController: SaveCustomerViewControllerDelegate {
    
    
    func addCustomerSuccessful() {
        // Reload data in the table view to reflect the changes
        fetchCustomers()
    }
    
    
    
}
