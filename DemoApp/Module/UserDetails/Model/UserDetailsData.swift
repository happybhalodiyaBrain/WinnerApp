//
//  profileDetailsData.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation

/// A struct that represents user details data.

struct UserDetailsData {
    /// The name of the user.
    var name: String = ""
    /// The mobile number of the user.
    var mobileNo: String = ""
    /// The email ID of the user.
    var emailID: String = ""
    /// The type of request the user is making (e.g., "Support", "Inquiry").
    var requestType: String = ""
    /// A detailed description of the user's request.
    var requestDetails: String = ""
    /// The time the user prefers to be contacted or a callback.
    var callBackTime: String = ""
}
