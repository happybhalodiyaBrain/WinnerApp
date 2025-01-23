import SwiftUI

struct CustomDivider: View {
    var color: Color = .blue // Customize the divider color
    var lineWidth: CGFloat = 1 // Customize the line width
    var borderWidth: CGFloat = 1 // Border width for the triangle
    var alignment: Alignment // Position for the triangle (leading, center, trailing)
    var triangleSize: CGSize = CGSize(width: 12, height: 8) // Customize the triangle size

    var body: some View {
        VStack(spacing: 0) {
            // Triangle Indicator Positioned by Alignment
            HStack {
                if alignment == .leading {
                    Triangle()
                        .stroke(color, lineWidth: borderWidth)
                        .frame(width: triangleSize.width, height: triangleSize.height)
                        .padding(.leading, 50)
                    Spacer()
                } else if alignment == .center {
                    Spacer()
                    Triangle()
                        .stroke(color, lineWidth: borderWidth)
                        .frame(width: triangleSize.width, height: triangleSize.height)
                    Spacer()
                } else if alignment == .trailing {
                    Spacer()
                    Triangle()
                        .stroke(color, lineWidth: borderWidth)
                        .frame(width: triangleSize.width, height: triangleSize.height)
                        .padding(.trailing, 50)
                }
            }
            // Horizontal Line
            Rectangle()
                .fill(color)
                .frame(height: lineWidth)
            
        }
    }
}

// Custom Shape for the Triangle
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY)) // Top-center
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom-right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom-left
        path.closeSubpath()
        return path
    }
}

// Preview for Testing
#Preview {
    
        CustomDivider(color: Color(UIColor.appclr0A195C), lineWidth: 1, borderWidth: 1, alignment: .leading)
    
}
