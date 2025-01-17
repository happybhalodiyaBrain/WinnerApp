import SwiftUI

struct OffersCell: View {
    // MARK: - Properties
    /// The notification data model associated with the cell.
    let notification: offersData
    
    // MARK: - Body
    var body: some View {
        // Calculate scaled image size based on the device's screen size and the XD design size.
        let imageSize = calculateScaledSize(xdWidth: 327.0, xdHeight: 127.0)
        VStack(alignment: .leading) {
            // Title
            Text(notification.title)
                .textStyle(size: 14,
                           color: Color(UIColor.appclr000000),
                           fontName: FontConstant.Almarai_Bold)
            
            // Subtitle
            Text(notification.subTitle)
                .textStyle(size: 12,
                           color: Color(UIColor.appclr92949F),
                           fontName: FontConstant.Almarai_Regular)
                .padding(.top, 2)
            
            // Notification Image
            Image(Icons.rectImage.rawValue)
                .resizable()
                .frame(width:.infinity, height: imageSize.height)
                .cornerRadius(4)
                .padding(.top, 10)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(8) // Add padding inside the cell
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor.appclrDDDDDD))
            )
        
        
    }
}
// MARK: - Preview

#Preview {
    OffersCell(
        notification: offersData(
            title: "Lorem ipsum dolor sit amet, consectetur",
            subTitle: "Proin sodales vehicula sapien, mattis euismod tellus eleifend....",
            notificationImage: "Placeholder"
        )
    )
}
