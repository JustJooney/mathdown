//
//  GameOverView.swift
//  mathdown
//
//  Created by Joon Kang on 12/2/21.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        VStack {
            Text("Game Over")
            
            Text("Highscore: 10 points")
            
            Text("Please write name for highscore")
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
