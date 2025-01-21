//
//  UserDetailsViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
import UIKit

/// A ViewModel that manages the logic for user details form submission.

class UserDetailsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// Holds the user details data that is bound to the view.
    @Published var formData = UserDetailsData()
    /// An array of error messages for invalid fields.
    @Published var errorMessages: [String] = []
    /// A single message to be shown in case of an error.
    @Published var alertMessage: String = ""
    /// A flag to indicate whether to show an alert in case of error.
    @Published var showAlert: Bool = false
    /// Options for the request type dropdown (e.g., "Return", "Exchange").
    let requestType = ["Return", "Exchange"] // Options for the dropdown
    
    /// Validates the fields in the form.
    ///
    /// This method checks if each field in the form is valid using the `ValidationManager`
    /// and updates the `alertMessage` and `showAlert` properties accordingly.
    ///
    /// - Returns: `true` if all fields are valid, `false` otherwise.
    func validateFields() -> Bool {
        alertMessage = ""
        
        // Validate the 'name' field
        if let error = ValidationManager.isNotEmpty(formData.name, fieldName: ErrorMessages.err_name) {
            alertMessage = error
            showAlert = true
        }
        
        // Validate the 'mobileNo' field (non-empty and valid format)
        else if let error = ValidationManager.isNotEmpty(formData.mobileNo, fieldName: ErrorMessages.err_mobile) {
            alertMessage = error
            showAlert = true
        } else if let error = ValidationManager.isValidMobileNumber(formData.mobileNo) {
            alertMessage = error
            showAlert = true
        }
        
        // Validate the 'requestType' field
        else if let error = ValidationManager.isNotEmpty(formData.requestType, fieldName: ErrorMessages.err_requestType) {
            alertMessage = error
            showAlert = true
        }
        
        // Validate the 'emailID' field (non-empty and valid email format)
        else if let error = ValidationManager.isNotEmpty(formData.emailID, fieldName: ErrorMessages.err_email) {
            alertMessage = error
            showAlert = true
        } else if let error = ValidationManager.isValidEmail(formData.emailID) {
            alertMessage = error
            showAlert = true
        }
        // Validate the 'requestDetails' field
        else if let error = ValidationManager.isNotEmpty(formData.requestDetails, fieldName: ErrorMessages.err_requestDetails) {
            alertMessage = error
            showAlert = true
        }
        
        return alertMessage.isEmpty // If no errors, validation is successful
    }
    
    /// Submits the form if all fields are valid.
    ///
    /// If the validation passes, this method prints a success message with the form data.
    /// Otherwise, it prints the validation error messages.
    func submitForm() {
        if validateFields() {
            // Proceed with submission logic
            print("Form submitted successfully with: \(formData)")
        } else {
            // Print errors (or show them in the UI)
            print("Validation failed with errors: \(errorMessages)")
        }
    }
    ///  Navigate to back screen 
    func onNavigateToBack () {
        NavigationService.shared.pop()
    }
    /// dismiss keyboard
     func dismissKeyboard() {
           UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
       }
}

