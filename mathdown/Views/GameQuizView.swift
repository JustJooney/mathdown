//
//  GameQuizView.swift
//  mathdown
//
//  Created by Joon Kang on 12/2/21.
//

import SwiftUI

struct GameQuizView: View {

    @Binding var gameTimer: Float
    @Binding var isWrong: Bool
    @Binding var isGoingToGameOver: Bool
    @Binding var score: Int
    
    @StateObject var gameGenerator = GameGenerator()
    
    
    var body: some View {
        VStack{
            Text("\(gameGenerator.firstNumber) * \(gameGenerator.secondNumber)")
                .font(.largeTitle)
            
            ForEach(Array(gameGenerator.answers), id: \.self) { answer in
                Button {
                    if answer == gameGenerator.totalNumber {
                        nextQuestion()
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
                            .foregroundColor( isWrong ? (answer == gameGenerator.totalNumber ? .green : .red) : .black)
            
                    }
                    
                }
                .disabled(isWrong)
            }
        }
        .onAppear {
            gameGenerator.generateNewQuiz()
            gameTimer = 1.0
        }
    }
    
    func nextQuestion() {
        gameGenerator.generateNewQuiz()
        score += 1
        gameTimer = 1.0
        
    }
}
