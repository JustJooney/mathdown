//
//  GameQuizView.swift
//  mathdown
//
//  Created by Joon Kang on 12/2/21.
//

import SwiftUI

struct GameQuizView: View {
    
    @State private var isRight = false
    @Binding var gameTimer: Int
    @Binding var isWrong: Bool
    @Binding var isGoingToGameOver: Bool
    @Binding var score: Int
    
    var body: some View {
        VStack{
            Text("\(GameGenerator.instance.firstNumber) * \(GameGenerator.instance.secondNumber)")
                .font(.largeTitle)
            
            ForEach(Array(GameGenerator.instance.answers), id: \.self) { answer in
                Button {
                    if answer == GameGenerator.instance.totalNumber {
                        isRight.toggle()
                        nextQuestion()
                        score += 1
                        gameTimer = 100
                    }
                    else {
                        isWrong.toggle()
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                            isGoingToGameOver.toggle()
                        }
                    }
                } label: {
                    
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 100, height: 100)
                            
                        
                        Text("\(answer)")
                            .foregroundColor( isWrong ? (answer == GameGenerator.instance.totalNumber ? .green : .red) : .black)
            
                    }
                    
                }
                .disabled(isWrong)
            }
        }
    }
    
    func nextQuestion() {
        
        isRight.toggle()
        GameGenerator.instance.generateNewQuiz()
        
    }
}
