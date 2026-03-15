import SwiftUI

struct CalculatorButton: View {
    let title: String
    let color: Color
    var textColor: Color = .white
    var size: CGFloat = 80
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: size * 0.38))
                .foregroundColor(textColor)
                .frame(width: size, height: size)
                .background(color)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CalculatorButton(title: "1", color: .gray)
}
