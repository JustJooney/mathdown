//
//  GameGenerator.swift
//  mathdown
//
//  Created by Joon Kang on 12/2/21.
//

import Foundation

class GameGenerator {
    
    static let instance = GameGenerator()
    
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var totalNumber: Int = 0
    var answers: Set<Int> = [0, 1, 2, 3]
    
    func generateNewQuiz(){
        
        self.firstNumber = Int.random(in: 1...12)
        self.secondNumber = Int.random(in: 1...12)
        self.totalNumber = firstNumber * secondNumber
        
        self.answers = [self.totalNumber + 1, self.totalNumber + 2, self.totalNumber - 1, self.totalNumber]

    }
}
