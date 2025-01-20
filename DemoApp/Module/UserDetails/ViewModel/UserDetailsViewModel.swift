//
//  UserDetailsViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
class UserDetailsViewModel: ObservableObject {
    @Published var formData = UserDetailsData()
    @Published var errorMessages: [String] = []
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    let requestType = ["Return", "Exchange"] // Options for the dropdown
    
    // Method to validate all fields
    func validateFields() -> Bool {
        alertMessage = ""
        
        // Validate each field
        if let error = ValidationManager.isNotEmpty(formData.name, fieldName: InputFields.txt_name) {
            alertMessage = error
            showAlert = true
        }
        
         else if let error = ValidationManager.isNotEmpty(formData.mobileNo, fieldName: InputFields.txt_mobileNo) {
            alertMessage = error
            showAlert = true
        }
        
        else if let error = ValidationManager.isNotEmpty(formData.requestType, fieldName: ErrorMessages.err_findOrder) {
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
        
        else if let error = ValidationManager.isNotEmpty(formData.requestDetails, fieldName: InputFields.txt_requestDetails) {
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
