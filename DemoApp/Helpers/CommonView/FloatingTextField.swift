import Foundation
import SwiftUI


struct FloatingTextField: View {
    
    // MARK: - Variable
    private let textFieldHeight: CGFloat
    private let placeHolderText: String
    @Binding private var text: String
    @State private var isEditing = false
    private let isMultiline: Bool
    
    private var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }
    
    // MARK: - init
    public init(placeHolder: String,
                text: Binding<String>,
                isMultiline: Bool = false) {
        self._text = text
        self.placeHolderText = placeHolder
        self.isMultiline = isMultiline
        self.textFieldHeight = isMultiline ? 100 : 44
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                
                TextField(isEditing ? "" : placeHolderText, text: $text, onEditingChanged: { (edit) in
                    isEditing = edit
                })
                .textStyle(size: 16, color: Color(UIColor.appclr000000), fontName: FontConstant.Almarai_Regular)
                .accentColor(Color(UIColor.appclr000000))
                .animation(Animation.easeInOut(duration: 0.4), value: EdgeInsets())
                .frame(alignment: .leading)
                .lineLimit(isMultiline ? 10 : 1)
            }
            .padding()
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(height: textFieldHeight)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor.appclrDDDDDD),lineWidth: 1)
            }
            
            // Floating Placeholder
            Text(isEditing ? " " + placeHolderText + " " : "")
                .textStyle(size: isEditing ? 12 : 16, color:  Color(UIColor.appclrB6B7B7),
                           fontName: FontConstant.Almarai_Regular)
                .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.2)
                .animation(Animation.easeInOut(duration: 0.4), value: shouldPlaceHolderMove)
                .background(Color(UIColor.systemBackground))
                .padding(shouldPlaceHolderMove ?
                         EdgeInsets(top: 0, leading: 15, bottom: textFieldHeight, trailing: 0) :
                            EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
        }
        .frame(height: textFieldHeight)
        
    }
}

#Preview {
    // Preview with a sample binding for text
    @State  var sampleText = "Sample text"
    
    return FloatingTextField(placeHolder: "Enter your text", text: $sampleText)
}
