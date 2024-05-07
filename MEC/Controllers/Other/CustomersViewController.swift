//
//  CustomersViewController.swift
//  MEC
//
//  Created by Dana Sami Abu Eid on 30/04/2024.
//

import UIKit

class CustomersViewController: UIViewController {

    let stackView = UIStackView()
    let searchBar = UISearchBar()
    let customerTable = UITableView()
    let customerTableCell = UITableViewCell()
    let addNewCustomer = UIBarButtonItem()
    var addNewCustomerButton: UIBarButtonItem! // Declare the button as an instance variable
    let cellId = "insertCellId"

    var games = ["Space Invaders",
                   "Dragon Slayer",
                   "Disks of Tron",
                   "Moon Patrol",
                   "Galaga"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Customers"
      navigationController?.toolbar.tintColor = .navyBlue
        addNewCustomerButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewCustomerTapped))
             
             // Set the button as the right bar button item
             navigationItem.rightBarButtonItem = addNewCustomerButton
        
        
        Style()
        layout()
        customerTable.delegate = self
        customerTable.dataSource = self
        customerTable.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

    }
    

}

// MARK: - UI Set Up

extension CustomersViewController {
    
    func Style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        
        searchBar.barTintColor = .appWhite
        customerTable.tintColor = .drakNavy
        customerTable.backgroundColor = .appWhite
        searchBar.showsCancelButton = true 
        
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
    
    func AddCustomers(){
        
        
        
    }
    
    @objc func addNewCustomerTapped() {
        
        let CustomerInfoVC = CustomersInfoViewController()
        present(CustomerInfoVC, animated: true, completion: nil)
       // navigationController?.pushViewController(CustomerInfoVC, animated: true)


       }

}


// MARK: - TableView Set Up


extension CustomersViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
  //  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
 //   }
    
}



// MARK:  - UITableView DataSource

extension CustomersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = games[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completionHandler) in
            self.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        action.image = makeSymbolImage(systemName: "trash")
        
        let configuration = UISwipeActionsConfiguration(actions: [action])
        
        return configuration
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }}


// MARK: - SearchBar Set Up


extension CustomersViewController: UISearchBarDelegate {
    
    
}
