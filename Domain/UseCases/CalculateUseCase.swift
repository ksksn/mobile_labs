//
//  CalculateUseCase.swift
//  Mobile
//
//  Created by [твое имя] на 03.03.2026.
//

import Foundation

final class CalculateUseCase {
    
    init() {
    }

    func execute(
        firstNumber: Double,
        secondNumber: Double,
        operation: CalculatorModel.Operation
    ) -> Double? {
        
        switch operation {
        case .addition:
            return firstNumber + secondNumber
            
        case .subtraction:
            return firstNumber - secondNumber
            
        case .multiplication:
            return firstNumber * secondNumber
            
        case .division:
            guard secondNumber != 0 else {
                return nil
            }
            return firstNumber / secondNumber
        }
    }
}
