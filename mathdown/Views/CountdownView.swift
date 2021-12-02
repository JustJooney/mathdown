//
//  CountdownView.swift
//  mathdown
//
//  Created by Joon Kang on 12/2/21.
//

import SwiftUI

struct CountdownView: View {
    
    @State private var timeRemaining = 0
    @Binding var isStartingShow: Bool
    
    let countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(.red)
                .ignoresSafeArea()
            
            Text("\(timeRemaining)")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
        .onChange(of: timeRemaining, perform: { timeRemain in
            if timeRemain > 0 {
                SoundEffect.instance.playSound(sound: .count)
            }
            else if timeRemain == 0 {
                SoundEffect.instance.playSound(sound: .countStart)
            }
        })
        .onReceive(countdownTimer) { time in
        
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                
                if timeRemaining == 0 {
                    isStartingShow.toggle()
                }
            }
            
        }
        .onAppear {
            timeRemaining = 3
        }
    
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(isStartingShow: .constant(true))
    }
}
