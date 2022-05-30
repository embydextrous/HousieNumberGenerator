//
//  HousieModel.swift
//  HousieNumberGenerator
//
//  Created by Arjit Agarwal on 03/07/21.
//

struct HousieModel {
    private var currentNumber: Int = 0
    private var previousNumber: Int = 0
    private var hackedNumber: Int? = nil
    private var remainingNums = Set(1...90)
   
    mutating func generateNewNumber() -> Int {
        if remainingNums.isEmpty {
            return -1
        }
        previousNumber = currentNumber
        if let safeHackedNumber = hackedNumber {
            currentNumber = safeHackedNumber
            hackedNumber = nil
        } else {
            currentNumber = remainingNums.randomElement()!
        }
        remainingNums.remove(currentNumber)
        remainingNums = Set(remainingNums.shuffled())
        return currentNumber
    }
    
    func getPreviousNumber() -> Int {
        return previousNumber
    }
    
    func getCurrentNumber() -> Int {
        return currentNumber
    }
    
    func getTextToSpeak() -> String {
        if currentNumber < 10 {
            return "Only Number \(currentNumber)"
        } else {
            return "\(currentNumber / 10), \(currentNumber % 10); \(currentNumber)"
        }
    }
    
    mutating func setHackedNumber(_ number: Int) {
        if remainingNums.contains(number) {
            hackedNumber = number
        }
    }
}
