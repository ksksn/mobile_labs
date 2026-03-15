import SwiftUI

private extension Color {
    static let digitColor    = Color(red: 0.40, green: 0.33, blue: 0.27)
    static let utilityColor  = Color(red: 0.63, green: 0.52, blue: 0.42)
    static let operatorColor = Color(red: 0.85, green: 0.77, blue: 0.65)
}

struct ButtonsView: View {
    @ObservedObject var viewModel: CalculatorViewModel

    var body: some View {
        GeometryReader { geo in
            let spacing: CGFloat = 8
            let padding: CGFloat = 16
            let size = (geo.size.width - padding * 2 - spacing * 3) / 4

            VStack(spacing: spacing) {
                HStack(spacing: spacing) {
                    CalculatorButton(title: "AC",  color: .utilityColor, size: size, action: { viewModel.didTapClear() })
                    CalculatorButton(title: "⌫",   color: .utilityColor, size: size, action: { viewModel.didTapBackspace() })
                    CalculatorButton(title: "%",   color: .utilityColor, size: size, action: { viewModel.didTapPercent() })
                    CalculatorButton(title: "÷",   color: .operatorColor, textColor: .digitColor, size: size, action: { viewModel.didTapOperation("÷") })
                }
                HStack(spacing: spacing) {
                    CalculatorButton(title: "7",   color: .digitColor, size: size, action: { viewModel.didTapDigit("7") })
                    CalculatorButton(title: "8",   color: .digitColor, size: size, action: { viewModel.didTapDigit("8") })
                    CalculatorButton(title: "9",   color: .digitColor, size: size, action: { viewModel.didTapDigit("9") })
                    CalculatorButton(title: "×",   color: .operatorColor, textColor: .digitColor, size: size, action: { viewModel.didTapOperation("×") })
                }
                HStack(spacing: spacing) {
                    CalculatorButton(title: "4",   color: .digitColor, size: size, action: { viewModel.didTapDigit("4") })
                    CalculatorButton(title: "5",   color: .digitColor, size: size, action: { viewModel.didTapDigit("5") })
                    CalculatorButton(title: "6",   color: .digitColor, size: size, action: { viewModel.didTapDigit("6") })
                    CalculatorButton(title: "−",   color: .operatorColor, textColor: .digitColor, size: size, action: { viewModel.didTapOperation("−") })
                }
                HStack(spacing: spacing) {
                    CalculatorButton(title: "1",   color: .digitColor, size: size, action: { viewModel.didTapDigit("1") })
                    CalculatorButton(title: "2",   color: .digitColor, size: size, action: { viewModel.didTapDigit("2") })
                    CalculatorButton(title: "3",   color: .digitColor, size: size, action: { viewModel.didTapDigit("3") })
                    CalculatorButton(title: "+",   color: .operatorColor, textColor: .digitColor, size: size, action: { viewModel.didTapOperation("+") })
                }
                HStack(spacing: spacing) {
                    CalculatorButton(title: "+/-", color: .utilityColor, size: size, action: { viewModel.didTapToggleSign() })
                    CalculatorButton(title: "0",   color: .digitColor, size: size, action: { viewModel.didTapDigit("0") })
                    CalculatorButton(title: ".",   color: .digitColor, size: size, action: { viewModel.didTapDot() })
                    CalculatorButton(title: "=",   color: .operatorColor, textColor: .digitColor, size: size, action: { viewModel.didTapEquals() })
                }
            }
            .padding(.horizontal, padding)
            .padding(.vertical, 12)
        }
    }
}

#Preview { ButtonsView(viewModel: CalculatorViewModel()) }
