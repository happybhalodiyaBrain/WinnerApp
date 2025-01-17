import SwiftUI

struct NotificationCell: View {
    let item: NotificationData
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing:2) {
                Text(item.title)
                    .textStyle(size: 14, color: Color(UIColor.clr000000),
                               fontName: FontConstant.Almarai_Bold)
                
                HStack(spacing: 8){
                    if item.isRead {
                        Circle()
                            .fill(Color(UIColor.appclrEB0E3C))
                            .frame(width: 10, height: 10)
                    }
                    Text(item.datetime)
                        .textStyle(size: 12, color: Color(UIColor.appclr92949F),
                                   fontName: FontConstant.Almarai_Regular)
                    
                }.padding(.top, 2)
                
                HStack(alignment: .top,spacing:15){
                    Image(Icons.dummy.rawValue)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(4)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(item.description)
                            .textStyle(size: 14, color: Color(UIColor.appclr000000),
                                       fontName: FontConstant.Almarai_Regular)
                            .multilineTextAlignment(.leading)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                }.padding(.top, 10)
                
                
            }
            .padding(8)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(UIColor.appclrDDDDDD))
            )
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
