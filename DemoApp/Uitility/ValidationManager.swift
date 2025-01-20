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
            return "\(fieldName) \(ErrorMessages.err_cannotbeempty)"
        }
        return nil
    }
    
    // Validation for email
    static func isValidEmail(_ email: String) -> String? {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: email) {
            return ErrorMessages.err_invalidEmail
        }
        return nil
    }
    
    // Validation for ZIP Code (assuming 5-digit ZIP)
    static func isValidZipCode(_ zip: String) -> String? {
        let zipRegex = "^[0-9]{5}$"
        let zipPredicate = NSPredicate(format: "SELF MATCHES %@", zipRegex)
        if !zipPredicate.evaluate(with: zip) {
            return ErrorMessages.err_invalidZipCode
        }
        return nil
    }
    
    // Validation for Mobile Number (assuming 10 digits)
       static func isValidMobileNumber(_ mobile: String) -> String? {
           let mobileRegex = "^[0-9]{10}$" // Only digits, 10 characters long
           let mobilePredicate = NSPredicate(format: "SELF MATCHES %@", mobileRegex)
           if !mobilePredicate.evaluate(with: mobile) {
               return ErrorMessages.err_invalidMobileNo
           }
           return nil
       }
}
