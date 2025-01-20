
import Foundation
import SwiftUI

/// Enum to define the types of alerts

enum AlertType {
    case emptyError
    case signOut
}

extension View {
    /// A custom alert view modifier for showing alerts with different configurations based on the `AlertType`.
       ///
       /// - Parameters:
       ///   - isPresented: A binding to a boolean that controls whether the alert is presented.
       ///   - title: The title of the alert.
       ///   - message: The message body of the alert.
       ///   - dismissButton: The dismiss button of the alert. Default is an "OK" button.
       ///   - alertType: The type of alert to display. Default is `.emptyError`.
       ///   - primaryButton: The primary button of the alert. Default is an "OK" button.
       ///   - secondaryButton: The secondary button of the alert. Default is a "Cancel" button.
       ///   - signOutAction: An optional closure to be executed when the "OK" button is tapped for sign-out alerts.
       ///
       /// - Returns: A modified view that displays an alert based on the given parameters.
    func showAlert(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        dismissButton: Alert.Button = .default(Text("OK")),
        alertType: AlertType = .emptyError,
        primaryButton: Alert.Button = .default(Text("OK")),
        secondaryButton: Alert.Button = .default(Text("Cancel")),
        signOutAction: (() -> Void)? = nil
    ) -> some View {
        switch(alertType){
        case .emptyError :
            // Show an alert with a title, message, and dismiss button for the empty error case
            self.alert(
                isPresented: isPresented,
                content: {
                    Alert(
                        title: Text(title),
                        message: Text(message),
                        dismissButton: dismissButton
                    )
                }
            )
        case .signOut :
            // Show an alert with primary and secondary buttons for sign-out case
            self.alert(
                isPresented: isPresented,
                content: {
                    Alert(
                        title: Text(title),
                        message: Text(message),
                        primaryButton: .default(Text("OK"), action: {
                            signOutAction?()
                        }),
                        secondaryButton: secondaryButton
                    )
                }
            )
        }
    }
}

