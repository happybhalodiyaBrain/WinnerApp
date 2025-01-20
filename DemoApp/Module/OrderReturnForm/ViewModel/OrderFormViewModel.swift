//
//  OrderFormViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation

class OrderFormViewModel: ObservableObject {
    
    // MARK: - Published Properties
    /// Holds the order form data that is bound to the view.
    @Published var formData = OrderFormData()
    /// An array of error messages for invalid fields.
    @Published var errorMessages: [String] = []
    /// A single message to be shown in case of an error.
    @Published var alertMessage: String = ""
    /// A flag to indicate whether to show an alert in case of error.
    @Published var showAlert: Bool = false
    
    /// Options for how to find an order (e.g., by Order ID, Email, or Phone Number).
    
    let orderByOptions = ["Order ID", "Email", "Phone Number"] // Options for the dropdown
    
    /// Validates the fields in the form.
    ///
    /// This method checks if each field in the form is valid using the `ValidationManager`
    /// and updates the `alertMessage` and `showAlert` properties accordingly.
    ///
    /// - Returns: `true` if all fields are valid, `false` otherwise.
    func validateFields() -> Bool {
        alertMessage = ""
        
        // Validate the 'orderID' field
        if let error = ValidationManager.isNotEmpty(formData.orderID, fieldName: InputFields.txt_orderID) {
            alertMessage = error
            showAlert = true
        }
        // Validate the 'billingLastName' field
        else if let error = ValidationManager.isNotEmpty(formData.billingLastName, fieldName: InputFields.txt_billingLastName) {
            alertMessage = error
            showAlert = true
        }
        // Validate the 'findOrderBy' field (dropdown)
        else if let error = ValidationManager.isNotEmpty(formData.findOrderBy, fieldName: ErrorMessages.err_findOrder) {
            alertMessage = error
            showAlert = true
        }
        // Validate the 'emailID' field (non-empty and valid email format)
        else if let error = ValidationManager.isNotEmpty(formData.emailID, fieldName: InputFields.txt_emailID) {
            alertMessage = error
            showAlert = true
        } else if let error = ValidationManager.isValidEmail(formData.emailID) {
            alertMessage = error
            showAlert = true
        }
        // Validate the 'billingZipCode' field (non-empty and valid zip code format)
        else if let error = ValidationManager.isNotEmpty(formData.billingZipCode, fieldName: InputFields.txt_billingZipCode) {
            alertMessage = error
            showAlert = true
        } else if let error = ValidationManager.isValidZipCode(formData.billingZipCode) {
            alertMessage = error
            showAlert = true
        }
        
        return alertMessage.isEmpty // If no errors, validation is successful
    }
    
    /// Submits the form if all fields are valid.
    ///
    /// If the validation passes, this method prints a success message with the form data
    /// and navigates to the signup page. Otherwise, it prints the validation error messages.
    func submitForm() {
        if validateFields() {
            // Proceed with submission logic
            print("Form submitted successfully with: \(formData)")
            onNavigateToSignupPage()
        } else {
            // Print errors (or show them in the UI)
            print("Validation failed with errors: \(errorMessages)")
        }
    }
    
    /// Navigates to the user details page after form submission.
    func onNavigateToSignupPage () {
        NavigationService.shared.push(to: .UserDetails)
    }
}
