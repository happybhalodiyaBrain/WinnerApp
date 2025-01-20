//
//  AppConstant.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation

// MARK: - Header Constants
/// A struct containing static constants for various header titles used across the app.
struct Header {
    static let winnerList = "Winners of Previous Competition"
    static let winnerDetails = "Winner of Competition Name"
    static let notification = "Notification"
    static let orderAndReturn = "Order and Returns"
    static let fillTheFollowingData = "Kindly Fill the Following Data"
}

struct InputFields {
    static let txt_orderID = "Order ID"
    static let txt_billingLastName = "Billing Last Name"
    static let txt_selectOption = "Find Order By"
    static let txt_emailID =  "Email ID"
    static let txt_emailid =  "Email*"
    static let txt_billingZipCode = "Billing ZIP Code"
    static let txt_name = "Name*"
    static let txt_mobileNo = "Mobile No.*"
    static let txt_requestType = "Request Type*"
    static let txt_requestDetails = "Request Details*"
    static let txt_timeForCallBAck = "Pref time for callback"
}

struct Buttons {
    static let btn_submit = "Submit"
}

struct ErrorMessages {
    static let err_findOrder = "Order by"
    static let err_validationError = "Validation Error"
    static let err_name = "Name"
    static let err_email = "Email"
    static let err_mobile = "Mobile No."
    static let err_requestType = "Request Type"
    static let err_requestDetails = "Request Details"
    static let err_callBackTime = "Pref Call Back time"
    static let err_cannotbeempty = "cannot be empty."
    static let err_invalidEmail  = "Invalid email address."
    static let err_invalidZipCode = "Invalid ZIP Code. It must be 5 digits."
    static let err_invalidMobileNo =  "Invalid mobile number. It must be 10 digits."
}
