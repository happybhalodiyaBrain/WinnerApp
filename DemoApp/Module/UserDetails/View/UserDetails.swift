import SwiftUI

struct UserDetails: View {
    
    @StateObject private var viewModel = UserDetailsViewModel()

    var body: some View {
        VStack{
            CustomHeader(greetingText: Header.fillTheFollowingData, onBackTapped: {}, showRightButtons: false, showBackButton : true, cartBadgeCount: 0)
            
            VStack(spacing: 24){
                FloatingTextField(
                    placeHolder: InputFields.txt_name,
                    text: $viewModel.formData.name
                )
                
                FloatingTextField(
                    placeHolder: InputFields.txt_mobileNo,
                    text: $viewModel.formData.mobileNo
                )
                
                FloatingTextField(
                    placeHolder: InputFields.txt_emailID,
                    text: $viewModel.formData.emailID
                )
                
                DropdownPicker(
                    options: viewModel.requestType,
                    selectedOption: $viewModel.formData.requestType,
                    placeholder: InputFields.txt_requestType
                )
                
                FloatingTextField(
                    placeHolder: InputFields.txt_requestDetails,
                    text: $viewModel.formData.requestDetails,
                    isMultiline: true
                )
                
                
               
//                FloatingTextField(
//                    placeHolder: InputFields.txt_billingZipCode,
//                    text: $viewModel.formData.billingZipCode
//                )
                
            }.padding(.horizontal, 16)
                .padding(.top, 24)
            
            CommonButton(
                title: Buttons.btn_submit,
                action: {
                    viewModel.submitForm()
                }
            ).padding(.vertical, 32)
            
            Spacer()
        }
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
