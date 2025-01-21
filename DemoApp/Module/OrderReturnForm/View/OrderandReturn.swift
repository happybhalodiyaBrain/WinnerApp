
import SwiftUI

struct OrderandReturn: View {
    
    /// The view model responsible for handling the business logic of the order form.
    @StateObject private var viewModel = OrderFormViewModel()
    
    
    //MARK: Body
    
    var body: some View {
        VStack{
            // Custom header with greeting text and back button
            CustomHeader(greetingText: Header.orderAndReturn, onBackTapped: {}, showRightButtons: false, showBackButton : true, cartBadgeCount: 0)
            ScrollView{
                VStack(spacing: 24){
                    // Order ID input field
                    FloatingTextField(
                        placeHolder: InputFields.txt_orderID,
                        text: $viewModel.formData.orderID
                    )
                    // Billing last name input field
                    FloatingTextField(
                        placeHolder: InputFields.txt_billingLastName,
                        text: $viewModel.formData.billingLastName
                    )
                    // Dropdown picker to select the method of finding the order
                    DropdownPicker(
                        options: viewModel.orderByOptions,
                        selectedOption: $viewModel.formData.findOrderBy,
                        placeholder: InputFields.txt_selectOption
                    )
                    // Email input field
                    FloatingTextField(
                        placeHolder: InputFields.txt_emailID,
                        text: $viewModel.formData.emailID
                    )
                    // Billing zip code input field
                    FloatingTextField(
                        placeHolder: InputFields.txt_billingZipCode,
                        text: $viewModel.formData.billingZipCode
                    )
                    
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
            .onTapGesture {
                viewModel.dismissKeyboard()
            }
        }
        // Submit button to trigger form submission
        .showAlert(
            isPresented: $viewModel.showAlert,
            title: ErrorMessages.err_validationError,
            message: viewModel.alertMessage
        )
    }
}

#Preview {
    OrderandReturn()
}
