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
    
    let columns = [
        GridItem(.fixed(175)),
        GridItem(.fixed(175))
    ]
    
    var body: some View {
        VStack{
            Text("\(gameGenerator.firstNumber) X \(gameGenerator.secondNumber)")
                .font(.system(size: 100))
            
            LazyVGrid(columns: columns, spacing: 50) {
                ForEach(Array(gameGenerator.answers), id: \.self) { answer in
                    Button {
                        if answer == gameGenerator.totalNumber {
                            SoundEffect.instance.playSound(sound: .rightanswer)
                            nextQuestion()
                        }
                        else {
                            SoundEffect.instance.playSound(sound: .wronganswer)
                            isWrong.toggle()
                            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                                isGoingToGameOver.toggle()
                            }
                        }
                    } label: {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isWrong ? (answer == gameGenerator.totalNumber ? .green : .red) : .black)
                                .frame(width: 125, height: 125)
                                .shadow(color: .gray, radius: 1, x: 0, y: 5)
                                
                            
                            Text("\(answer)")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                
                        }
                        
                    }
                    .disabled(isWrong)
                }
            }
            
            
        }
        .environment(\.colorScheme, .light)
        .onAppear {
            gameGenerator.generateNewQuiz()
            gameTimer = 1.0
        }
    }
    
    func nextQuestion() {
        
        if score > 10 {
            gameGenerator.generateNewQuiz(2)
            score += 1
            gameTimer = 1.0
        }
        else {
            gameGenerator.generateNewQuiz()
            score += 1
            gameTimer = 1.0
        }
        
        
        
    }
}

struct GameQuizView_Previews: PreviewProvider {
    static var previews: some View {
        GameQuizView(gameTimer: .constant(1.0), isWrong: .constant(false), isGoingToGameOver: .constant(false), score: .constant(0))
.previewInterfaceOrientation(.portrait)
    }
}
