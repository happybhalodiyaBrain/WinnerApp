//
//  OrderFormData.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
/// A struct that represents the data for an order form.
struct OrderFormData {
    
    /// The unique identifier for the order.
    var orderID: String = ""
    /// The last name of the billing person for the order.
    var billingLastName: String = ""
    /// The method used to find the order (e.g., by order ID, email).
    var findOrderBy: String = ""
    /// The email ID associated with the order.
    var emailID: String = ""
    /// The billing zip code for the order.
    var billingZipCode: String = ""
}
