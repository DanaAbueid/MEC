//
//  TabBarViewController.swift
//  MEC
//
//  Created by Dana Sami Abu Eid on 30/04/2024.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var addNewCustomerButton: UIBarButtonItem! // Declare the button as an instance variable
    
    let person = UIImage(systemName: "person")
    let personSelected = UIImage(systemName: "person.fill")
    
    let maintenance = UIImage(systemName: "gear")
    let maintenanceSelected = UIImage(systemName: "gear.badge.checkmark")
    
    let custmors = UIImage(systemName: "list.clipboard")
    let custmorsSelected = UIImage(systemName: "list.clipboard")
    
    let settings = UIImage(systemName: "gearshape")
    let settingsSelected = UIImage(systemName: "gearshape.fill")
    
    let employee = UIImage(systemName: "person.2.badge.gearshape")
    let employeeSelected = UIImage(systemName: "person.2.badge.gearshape.fill")



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.selectedIndex = 0
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Style()
        navigationItem.title = "Customers"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.navyBlue // Change the color as needed
        ]
        navigationItem.hidesBackButton = true
        
       /// setting up the view for each item
        setupViews()
        
        /// setting up the navigation title for each item
        self.delegate = self
    }
    
    // MARK: - Setting Tab Bar Style
    
    func Style(){
        tabBar.tintColor = .appWhite
        tabBar.backgroundColor = .drakNavy
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
    }
    
    
    

    
    // MARK: - Setting ViewControlllers
    
    func setupViews() {
    
        let vc1 = CustomersViewController()
        vc1.tabBarItem =  UITabBarItem(title: "Customers", image: custmors , selectedImage: custmorsSelected)

        let vc2 = MaintenanceViewController()
        vc2.tabBarItem = UITabBarItem(title: "Maintenance", image: maintenance , selectedImage: maintenanceSelected)
        
        let vc3 = EmployeesViewController()
        vc3.tabBarItem = UITabBarItem(title: "Employee", image: employee , selectedImage: employeeSelected)
        
        let vc4 = SettingsViewController()
        vc4.tabBarItem = UITabBarItem(title: "Settings", image: settings , selectedImage: settingsSelected)

        
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.title = "Customers"
        nav1.navigationBar.tintColor = .drakNavy
        nav1.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.navyBlue // Change the color as needed
        ]

        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.title = "Maintenance"
        nav2.navigationBar.tintColor = .drakNavy
        nav2.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.navyBlue // Change the color as needed
        ]

        let nav3 = UINavigationController(rootViewController: vc3)
        nav3.title = "Employee"
        nav3.navigationBar.tintColor = .drakNavy
        nav3.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.navyBlue // Change the color as needed
        ]


        let nav4 = UINavigationController(rootViewController: vc4)
        nav4.title = "Settings"
        nav4.navigationBar.tintColor = .drakNavy
        nav4.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.navyBlue // Change the color as needed
        ]

        
        
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    
    }
    
    @objc func addNewCustomerTapped() {
           // Handle add new customer button tap
       }
    
    
    // MARK: - Setting Tab Bar Delegate

    
    /*
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           // Get the selected view controller's index
           if let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) {
               // Update navigation bar title and color based on the selected index
               switch selectedIndex {
               case 0:
                   navigationItem.title = "Customers";
                   navigationController?.navigationBar.titleTextAttributes = [
                       .foregroundColor: UIColor.navyBlue // Change the color as needed
                   ]
                   addNewCustomerButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewCustomerTapped))
                   navigationItem.rightBarButtonItem = addNewCustomerButton
                  
                   
               case 1:
                   navigationItem.title = "Maintenance";
                   navigationController?.navigationBar.titleTextAttributes = [
                       .foregroundColor: UIColor.navyBlue// Change the color as needed
                   ]
                
                   
               case 2:
                   navigationItem.title = "Employee";                   navigationController?.navigationBar.titleTextAttributes = [
                       .foregroundColor: UIColor.navyBlue // Change the color as needed
                   ]
              
                   
               case 3:
                   navigationItem.title = "Settings";
                   navigationController?.navigationBar.titleTextAttributes = [
                       .foregroundColor: UIColor.navyBlue
                   ]
                   
               default:
                   break
               }
           }
       }
    
*/
}
