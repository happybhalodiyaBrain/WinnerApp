//
//  OrderFormViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation

class OrderFormViewModel: ObservableObject {
    @Published var formData = OrderFormData()
    @Published var errorMessages: [String] = []
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    let orderByOptions = ["Order ID", "Email", "Phone Number"] // Options for the dropdown
    
    // Method to validate all fields
    func validateFields() -> Bool {
        alertMessage = ""
        
        // Validate each field
        if let error = ValidationManager.isNotEmpty(formData.orderID, fieldName: InputFields.txt_orderID) {
            alertMessage = error
            showAlert = true
        }
        
         else if let error = ValidationManager.isNotEmpty(formData.billingLastName, fieldName: InputFields.txt_billingLastName) {
            alertMessage = error
            showAlert = true
        }
        
        else if let error = ValidationManager.isNotEmpty(formData.findOrderBy, fieldName: ErrorMessages.err_findOrder) {
            alertMessage = error
            showAlert = true
        }
        
        else if let error = ValidationManager.isNotEmpty(formData.emailID, fieldName: InputFields.txt_emailID) {
            alertMessage = error
            showAlert = true
        } else if let error = ValidationManager.isValidEmail(formData.emailID) {
            alertMessage = error
            showAlert = true
        }
        
        else if let error = ValidationManager.isNotEmpty(formData.billingZipCode, fieldName: InputFields.txt_billingZipCode) {
            alertMessage = error
            showAlert = true
        } else if let error = ValidationManager.isValidZipCode(formData.billingZipCode) {
            alertMessage = error
            showAlert = true
        }
        
        return alertMessage.isEmpty // If no errors, validation is successful
    }
    
    func submitForm() {
        if validateFields() {
            // Proceed with submission logic
            print("Form submitted successfully with: \(formData)")
        } else {
            // Print errors (or show them in the UI)
            print("Validation failed with errors: \(errorMessages)")
        }
    }
}
