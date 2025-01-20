//
//  ValidationManager.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation


struct ValidationManager {
    // Validation for empty field
    static func isNotEmpty(_ value: String, fieldName: String) -> String? {
        if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "\(fieldName) cannot be empty."
        }
        return nil
    }
    
    // Validation for email
    static func isValidEmail(_ email: String) -> String? {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: email) {
            return "Invalid email address."
        }
        return nil
    }
    
    // Validation for ZIP Code (assuming 5-digit ZIP)
    static func isValidZipCode(_ zip: String) -> String? {
        let zipRegex = "^[0-9]{5}$"
        let zipPredicate = NSPredicate(format: "SELF MATCHES %@", zipRegex)
        if !zipPredicate.evaluate(with: zip) {
            return "Invalid ZIP Code. It must be 5 digits."
        }
        return nil
    }
}
