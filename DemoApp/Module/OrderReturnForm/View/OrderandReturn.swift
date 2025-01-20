
import SwiftUI

struct OrderandReturn: View {
    
    @StateObject private var viewModel = OrderFormViewModel()
    
    
    var body: some View {
        VStack{
            CustomHeader(greetingText: Header.orderAndReturn, onBackTapped: {}, showRightButtons: false, showBackButton : true, cartBadgeCount: 0)
            
            VStack(spacing: 24){
                FloatingTextField(
                    placeHolder: InputFields.txt_orderID,
                    text: $viewModel.formData.orderID
                )
                
                FloatingTextField(
                    placeHolder: InputFields.txt_billingLastName,
                    text: $viewModel.formData.billingLastName
                )
                
                DropdownPicker(
                    options: viewModel.orderByOptions,
                    selectedOption: $viewModel.formData.findOrderBy,
                    placeholder: InputFields.txt_selectOption
                )
                
                FloatingTextField(
                    placeHolder: InputFields.txt_emailID,
                    text: $viewModel.formData.emailID
                )
                
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
