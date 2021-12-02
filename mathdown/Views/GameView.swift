//
//  GameView.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

struct GameView: View {
    
    @State var isGamePaused = false
    
    var body: some View {
        
        ZStack {
            
            Spacer()
                .fullScreenCover(isPresented: $isGamePaused) {
                    PauseView()
                }
            
            Button {
                isGamePaused.toggle()
            } label: {
                Text("Paused")
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
