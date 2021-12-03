//
//  GameOverView.swift
//  mathdown
//
//  Created by Joon Kang on 12/2/21.
//

import SwiftUI

struct GameOverView: View {
    
    @Binding var score: Int
    
    var body: some View {
        
        VStack {
            Text("Game Over")
            
            Text("Highscore: \(score) points")
            
            Text("Please write name for highscore")
        }
        .navigationBarHidden(true)
    }
}

//struct GameOverView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameOverView(score: )
//    }
//}
