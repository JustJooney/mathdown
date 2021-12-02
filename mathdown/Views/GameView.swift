//
//  GameView.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

struct GameView: View {
    
    @State var isGamePaused = false
    @State var isStartingShow = false
    @State var gameTimer = 0
    @State var isWrong = false
    @State var isGoingToGameOver = false
    @State var score = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            Spacer()
                .fullScreenCover(isPresented: $isGamePaused) {
                    PauseView()
                }
            
            Spacer()
                .fullScreenCover(isPresented: $isStartingShow) {
                    CountdownView(isStartingShow: $isStartingShow)
                }
            
            Spacer()
                .fullScreenCover(isPresented: $isGoingToGameOver) {
                    GameOverView(score: $score)
                }
            
            GeometryReader { geometry in
                VStack {
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
                                self.isGamePaused.toggle()
                            }
                        } label: {
                            Image(systemName: "pause.circle")
                                .resizable()
                                .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                                .padding()
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(isWrong ? .red : .green)
                            .padding(.horizontal)
                        
                        HStack {
                            
                            Rectangle()
                                .fill(.red)
                                .frame(width: CGFloat(gameTimer))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
    
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width / 10)
                    
                    GameQuizView(gameTimer: $gameTimer, isWrong: $isWrong, isGoingToGameOver: $isGoingToGameOver, score: $score)

                }
                
            } 
            
        }
        .navigationBarHidden(true)
        .onChange(of: isStartingShow == false, perform: { _ in
            GameGenerator.instance.generateNewQuiz()
        })
        .onReceive(timer, perform: { time in
            
            if (!isStartingShow) {
                
                if self.gameTimer > 0 {
                    self.gameTimer -= 10
                }
                if gameTimer == 0 {
                    isWrong = true
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                        isGoingToGameOver.toggle()
                    }
                }
            }
        })
        
        .onAppear {
            isStartingShow.toggle()
            gameTimer = 100
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
