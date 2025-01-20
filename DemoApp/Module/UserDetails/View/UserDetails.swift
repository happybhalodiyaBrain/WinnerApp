import SwiftUI

struct UserDetails: View {
    
    /// The view model responsible for handling the business logic of the form.
    
    @StateObject private var viewModel = UserDetailsViewModel()
    
    //MARK: Body
    var body: some View {
        VStack{
            // Custom header with greeting text and back button
            CustomHeader(greetingText: Header.fillTheFollowingData, onBackTapped: viewModel.onNavigateToBack, showRightButtons: false, showBackButton : true, cartBadgeCount: 0)
            
            VStack(spacing: 24){
                // Name input field
                FloatingTextField(
                    placeHolder: InputFields.txt_name,
                    text: $viewModel.formData.name,
                    isMultiline: false
                )
                // Mobile number input field (numeric keyboard and character limit)
                FloatingTextField(
                    placeHolder: InputFields.txt_mobileNo,
                    text: $viewModel.formData.mobileNo,
                    isMultiline: false,
                    keyboardType: .numberPad,
                    characterLimit: 10
                )
                // Email input field (email address keyboard type)
                FloatingTextField(
                    placeHolder: InputFields.txt_emailid,
                    text: $viewModel.formData.emailID,
                    isMultiline: false,
                    keyboardType: .emailAddress
                )
                // Dropdown picker for request type
                DropdownPicker(
                    options: viewModel.requestType,
                    selectedOption: $viewModel.formData.requestType,
                    placeholder: InputFields.txt_requestType
                )
                // Request details input field (multiline)
                FloatingTextField(
                    placeHolder: InputFields.txt_requestDetails,
                    text: $viewModel.formData.requestDetails,
                    isMultiline: true
                )
                // Time picker for selecting callback time
                TimePickerView(callBackTime: $viewModel.formData.callBackTime) // Binding the callbackTime
                
            }.padding(.horizontal, 16)
                .padding(.top, 24)
            
            // Submit button to trigger form submission
            CommonButton(
                title: Buttons.btn_submit,
                action: {
                    viewModel.submitForm()
                }
            ).padding(.vertical, 32)
            
            Spacer()
        }
        // Display alert when validation error occurs
        .showAlert(
            isPresented: $viewModel.showAlert,
            title: ErrorMessages.err_validationError,
            message: viewModel.alertMessage
        )
    }
}

#Preview {
    UserDetails()
}
