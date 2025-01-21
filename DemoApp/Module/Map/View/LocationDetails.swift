import SwiftUI

struct LocationDetails: View {
    // MARK: - Properties
    let location: LocationModel
    let onClose: () -> Void
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            // Header section with location name and close button
            HStack {
                Text(location.name)
                    .textStyle(size: 14, color: Color(UIColor.appclr000000),
                               fontName: FontConstant.Almarai_Bold)
                Spacer()
                Button(action: onClose) {
                    Image(Icons.ic_close.rawValue)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            // Location address
            Text(location.address)
                .textStyle(size: 14, color: Color(UIColor.appclr000000),
                           fontName: FontConstant.Almarai_Regular)
                .padding(.top,4)
            
            // Phone number section
            HStack{
                Text(locationDetails.phone)
                    .textStyle(size: 12, color: Color(UIColor.appclr707070),
                               fontName: FontConstant.Almarai_Regular)
                Text(location.phone)
                    .textStyle(size: 12, color: Color(UIColor.appclr000000),
                               fontName: FontConstant.OpenSans_Condensed_SemiBold)
            }.padding(.top,6)
            // Action buttons for "Get Directions" and "Call"
            HStack(spacing: 13) { // Adjust spacing as needed
                Button(action: {
                    // Action for Get Direction
                }) {
                    Text(locationDetails.getDirection)
                        .textStyle(size: 14, color: Color(UIColor.appclr0A195C),
                                   fontName: FontConstant.Almarai_Bold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Flexible width and height
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(UIColor.appclr0A195C), lineWidth: 2) // Bordered style
                        )
                }
                .frame(height: 30) // Set button height
                .contentShape(Rectangle()) // Ensure tappable area matches the frame
                
                Button(action: {
                    // Action for Call
                }) {
                    Text(locationDetails.call)
                        .textStyle(size: 14, color: Color(UIColor.appclrFFFFFF),
                                   fontName: FontConstant.Almarai_Bold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Flexible width and height
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(UIColor.appclr0A195C)) // Filled background
                        )
                }
                .frame(height: 30) // Set button height
                .contentShape(Rectangle()) // Ensure tappable area matches the frame
            }
            .frame(maxWidth: .infinity) // Make the entire HStack flexible in width
            .padding(.horizontal, 8)
            .padding(.vertical, 8)

            
        }.frame(width: .infinity, alignment: .leading) // Full width with left alignment
        .padding(8) // Padding around the details
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 10)) // Background with rounded corners and shadow
        .padding(.horizontal,16) // Horizontal padding around the view
        
    }
}
