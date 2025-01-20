import Foundation
import SwiftUI


struct FloatingTextField: View {
    
    // MARK: - Variable
    /// The height of the text field, which varies for multi-line vs single-line text fields.
    private let textFieldHeight: CGFloat
    /// The placeholder text to display when the text field is empty.
    private let placeHolderText: String
    /// A binding to the text entered by the user.
    @Binding private var text: String
    /// A state variable that tracks if the text field is being edited.
    @State private var isEditing = false
    /// A flag indicating whether the text field is multi-line.
    private let isMultiline: Bool
    /// The keyboard type to use for the text field.
    private let keyboardType: UIKeyboardType
    /// The maximum number of characters allowed in the text field.
    private let characterLimit: Int?
    /// A computed property to determine if the placeholder should move based on editing or text content.
    private var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }
    
    // MARK: - Initializer
        
        /// Initializes a `FloatingTextField` with the given parameters.
        /// - Parameters:
        ///   - placeHolder: The placeholder text to be displayed.
        ///   - text: A binding to the text entered by the user.
        ///   - isMultiline: A flag indicating if the text field is multi-line. Default is `false`.
        ///   - keyboardType: The keyboard type to use. Default is `.default`.
        ///   - characterLimit: The maximum number of characters allowed. Default is `nil` (no limit).
    public init(placeHolder: String,
                text: Binding<String>,
                isMultiline: Bool = false,
                keyboardType: UIKeyboardType = .default,
                characterLimit: Int? = nil) {
        self._text = text
        self.placeHolderText = placeHolder
        self.isMultiline = isMultiline
        self.textFieldHeight = isMultiline ? 111 : 44
        self.keyboardType = keyboardType
        self.characterLimit = characterLimit
    }
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                // Multi-line TextField (TextEditor)
                if(isMultiline) {
                    ZStack(alignment: .topLeading){
                        TextEditor(text: $text)
                            .textStyle(size: 16, color: Color(UIColor.appclr000000), fontName: FontConstant.Almarai_Regular)
                            .accentColor(Color(UIColor.appclr000000))
                            .animation(Animation.easeInOut(duration: 0.4), value: EdgeInsets())
                            .frame(alignment: .leading)
                            .onTapGesture {
                                isEditing = true
                            }
                            .onChange(of: text) {
                                isEditing = !text.isEmpty
                            }
                        if text.isEmpty && !isEditing {
                            Text(placeHolderText)
                                .textStyle(size: 16, color: Color(UIColor.appclrB6B7B7), fontName: FontConstant.Almarai_Regular)
                            
                        }
                    }
                    
                }
                // Single-line TextField
                else {
                    TextField(isEditing ? "" : placeHolderText, text: $text, onEditingChanged: { (edit) in
                        isEditing = edit
                    })
                    .keyboardType(keyboardType)
                    .textStyle(size: 16, color: Color(UIColor.appclr000000), fontName: FontConstant.Almarai_Regular)
                    .accentColor(Color(UIColor.appclr000000))
                    .animation(Animation.easeInOut(duration: 0.4), value: EdgeInsets())
                    .frame(alignment: .leading)
                    .onChange(of: text) {
                        enforceCharacterLimit()
                    }
                }
                
            }
            .padding()
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(height: textFieldHeight)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor.appclrDDDDDD),lineWidth: 1)
            }
            
            // Floating Placeholder Text
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
    // MARK: - Helper Functions
       
       /// Enforces a character limit on the text field content.
       /// - Ensures the text does not exceed the specified limit.
    private func enforceCharacterLimit() {
        if let limit = characterLimit, text.count > limit {
            text = String(text.prefix(limit))
        }
    }
}

