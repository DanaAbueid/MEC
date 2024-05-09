//
//  Customer.swift
//  MEC
//
//  Created by Dana Sami Abu Eid on 08/05/2024.
//

import Foundation

struct Customer: Codable {
    let customerId: Int
    var customerName: String
    var customerLocation: String
    var customerElevatorType: String
    var customerPanelElevator: String
    var tasks: [String]
}
