//
//  CalculatorModel.swift
//  Mobile
//
//  Created by [твое имя] on 03.03.2026.
//

import Foundation // Foundation - базовый модуль для чисел, строк и т.д.

// struct - это структура (как легковесный объект)
struct CalculatorModel {
    
    
    /// Первое число, которое ввел пользователь
    var firstNumber: Double?       // Double - число с плавающей точкой, ? - может быть nil (пусто)
    
    /// Второе число (если операция бинарная, как + или -)
    var secondNumber: Double?      // ? означает, что может не быть значения
    
    /// Текущая операция (+, -, ×, ÷)
    var currentOperation: Operation? // Operation - это enum, который мы создадим ниже
    
    /// Результат вычисления
    var result: Double?            // nil пока не посчитали
    
    /// Флаг, показывающий, только что посчитали результат или нет
    var isResultDisplayed: Bool = false // false по умолчанию
    
    // MARK: - Перечисление возможных операций
    // enum - перечисление (набор возможных значений)
    enum Operation {
        case addition       // сложение
        case subtraction    // вычитание
        case multiplication // умножение
        case division       // деление
        
        // computed property - вычисляемое свойство (возвращает символ операции)
        var symbol: String {
            switch self {   // switch - оператор выбора
            case .addition:
                return "+"
            case .subtraction:
                return "−"  // минус, но красивый
            case .multiplication:
                return "×"
            case .division:
                return "÷"
            }
        }
    }
}
