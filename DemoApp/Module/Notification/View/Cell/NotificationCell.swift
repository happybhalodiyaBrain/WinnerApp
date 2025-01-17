import SwiftUI

struct NotificationCell: View {
    // MARK: - Properties
    
    let item: NotificationData
    // MARK: - Body
    var body: some View {
       
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing:2) {
                // Title
                Text(item.title)
                    .textStyle(size: 14, color: Color(UIColor.clr000000),
                               fontName: FontConstant.Almarai_Bold)
                
                // Date and Read Indicator
                HStack(spacing: 8){
                    if item.isRead {
                        ReadIndicator()
                    }
                    Text(item.datetime)
                        .textStyle(size: 12, color: Color(UIColor.appclr92949F),
                                   fontName: FontConstant.Almarai_Regular)
                    
                }.padding(.top, 2)
                
                // Image and Description
                HStack(alignment: .top,spacing:15){
                    NotificationImage(imageName: Icons.dummy.rawValue)
                    DescriptionText(description: item.description)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top,10)
            }
            .padding(8)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor.appclrDDDDDD))
            )
    }
}

// MARK: - ReadIndicator Component
struct ReadIndicator: View {
    var body: some View {
        Circle()
            .fill(Color(UIColor.appclrEB0E3C))
            .frame(width: 10, height: 10)
    }
}
// MARK: - NotificationImage Component
struct NotificationImage: View {
    let imageName: String
    let imageSize  = calculateScaledSize(xdWidth: 100, xdHeight: 100)
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(4)
    }
}

// MARK: - DescriptionText Component
struct DescriptionText: View {
    let description: String
    var body: some View {
        Text(description)
            .textStyle(size: 14, color: Color(UIColor.appclr000000), fontName: FontConstant.Almarai_Regular)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
#Preview {
    NotificationCell(item: NotificationData(
        title: "Lorem ipsum dolor sit amet, consectetur",
        datetime: "04 Nov 2023 11:30AM",
        notificationImage: "Placeholder_image",
        description: "Proin sodales vehicula sapien, mattis euismod tellus eleifend sed. Interdum et malesuada fames ac ante...",
        isRead: true
    ))
}
