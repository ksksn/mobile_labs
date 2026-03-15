import SwiftUI

class CalculatorViewModel: ObservableObject {

    // Что показывает дисплей
    @Published var displayText: String = "0"

    // Первое число, операция, второе число
    private var firstNumber: Double? = nil
    private var operation: String? = nil
    private var waitingForSecond = false

    // MARK: - Нажатие на цифру
    func didTapDigit(_ digit: String) {
        if waitingForSecond {
            displayText = digit
            waitingForSecond = false
        } else {
            displayText = displayText == "0" ? digit : displayText + digit
        }
    }

    // MARK: - Нажатие на точку
    func didTapDot() {
        if !displayText.contains(".") {
            displayText += "."
        }
    }

    // MARK: - Нажатие на операцию (+, -, ×, ÷)
    func didTapOperation(_ op: String) {
        firstNumber = Double(displayText)
        operation = op
        waitingForSecond = true
    }

    // MARK: - Нажатие на =
    func didTapEquals() {
        guard let first = firstNumber,
              let op = operation,
              let second = Double(displayText) else { return }

        let result: Double
        switch op {
        case "+": result = first + second
        case "−": result = first - second
        case "×": result = first * second
        case "÷": result = second == 0 ? 0 : first / second
        default: return
        }

        displayText = formatNumber(result)
        firstNumber = nil
        operation = nil
        waitingForSecond = false
    }

    // MARK: - AC (сброс)
    func didTapClear() {
        displayText = "0"
        firstNumber = nil
        operation = nil
        waitingForSecond = false
    }

    // MARK: - ⌫ (удалить последний символ)
    func didTapBackspace() {
        if displayText.count > 1 {
            displayText.removeLast()
        } else {
            displayText = "0"
        }
    }

    // MARK: - +/- (смена знака)
    func didTapToggleSign() {
        if let number = Double(displayText) {
            displayText = formatNumber(number * -1)
        }
    }

    // MARK: - % (процент)
    func didTapPercent() {
        if let number = Double(displayText) {
            displayText = formatNumber(number / 100)
        }
    }

    // MARK: - Форматирование числа (убираем .0 у целых)
    private func formatNumber(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", number)
        } else {
            return String(number)
        }
    }
}
