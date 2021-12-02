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
    @State private var countdownTimer = 0
    
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
                            .fill(.green)
                            .padding(.horizontal)
                        
                        HStack {
                            
                            Rectangle()
                                .fill(.red)
                                .frame(width: CGFloat(countdownTimer))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        
                            
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width / 10)
                    
                    Text("\(GameGenerator.instance.firstNumber) * \(GameGenerator.instance.secondNumber)")
                        .font(.largeTitle)
                    
                    Button {
                        
                    } label: {
                        Text("\(GameGenerator.instance.totalNumber)")
                            .font(.largeTitle)
                    }
                    Button {
                        GameGenerator.instance.generateNewQuiz()
                    } label: {
                        Text("3")
                    }
                    Button {
                        
                    } label: {
                        Text("4")
                    }
                    Button {
                        
                    } label: {
                        Text("5")
                    }

                    
                }
                
            }
            
            
            
            
        }
        .navigationBarHidden(true)
        .onReceive(timer, perform: { time in
            if self.countdownTimer > 0 {
                self.countdownTimer -= 10
            }
            if countdownTimer == 0 {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
                    isGamePaused = true
                }
            }
        })
        .onAppear {
            countdownTimer = 100
//            isStartingShow.toggle()
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
