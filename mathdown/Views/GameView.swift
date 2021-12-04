//
//  GameView.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

struct GameView: View {
    
    @State var isGamePaused = false
    @State var gameTimer: Float = 0.0
    @State var isWrong = false
    @State var isGoingToGameOver = false
    @State var score = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
            ZStack {
                
                NavigationLink("", isActive: $isGamePaused) {
                    PauseView()
                }
                
                NavigationLink("", isActive: $isGoingToGameOver) {
                    GameOverView(score: $score)
                }
                
                GeometryReader { geometry in
                    VStack {
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                self.isGamePaused.toggle()
                            } label: {
                                Image(systemName: "pause.circle")
                                    .resizable()
                                    .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                                    .padding()
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Text("Points: \(score)")
                            .font(.title)
                        
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.red)
                                .padding(.horizontal)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isWrong ? .red : .green)
                                .padding(.horizontal)
                                .frame(width: CGFloat(geometry.size.width) * CGFloat(gameTimer))
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.width / 10)
                    
                        GameQuizView(gameTimer: $gameTimer, isWrong: $isWrong, isGoingToGameOver: $isGoingToGameOver, score: $score)
                        
                    }

                }
            }
            .onReceive(timer, perform: { (_) in
                if !isGamePaused {
                    self.lowerCountdown()
                }
            })
            .navigationBarHidden(true)
    }
    
    func lowerCountdown() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { time in
            withAnimation(.default) {

                if self.gameTimer <= 1 && self.gameTimer > 0.1{
                    if score < 15 {
                        self.gameTimer -= 0.1
                    }
                    else {
                        self.gameTimer -= 0.2
                    }
                }
                else {
                    isWrong = true
                    gameTimer = 1
                    time.invalidate()
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                        isGoingToGameOver = true
                    }
                }
            }
        }
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
