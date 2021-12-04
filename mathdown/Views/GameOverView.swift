//
//  GameOverView.swift
//  mathdown
//
//  Created by Joon Kang on 12/2/21.
//

import SwiftUI

struct GameOverView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Binding var score: Int
    @State var name = ""
    @State var isPressedNo = false
    @State var isTryAgain = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 20) {
                
                Spacer()
                
                Text("Game Over")
                    .foregroundColor(.black)
                    .font(.system(size: 70))
                
                
                Text("You scored \(score) points!")
                    .font(.system(size: 30))
                
                if (score > 0) {
                    TextField("", text: $name, prompt: Text("Enter name to save score"))
                        .font(.system(size: 30))
                        .textFieldStyle(.roundedBorder)
                }
                
                VStack {
                    
                    
                    Button  {
                        if score > 0 {
                            // add score to game and go to main menu
                            let scoreList = ScoreList(context: managedObjectContext)
                            scoreList.scorePoint = Int64(score)
                            scoreList.scoreName = name
                            
                            isPressedNo.toggle()
                        }
                        else {
                            isTryAgain.toggle()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.green)
                                .frame(width: geometry.size.width * 0.5, height: 70)
                                .shadow(color: .gray, radius: 1, x: 0, y: 5)
                            
                            Text(score > 0 ? "Submit" : "Try Again")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }
                    }
                    
                    NavigationLink("", isActive: $isTryAgain) {
                        CountdownView()
                    }
                    
                    
                    NavigationLink("", isActive: $isPressedNo) {
                        MainMenuView()
                    }
                    
                    Button {
                        isPressedNo.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.red)
                                .frame(width: geometry.size.width * 0.5, height: 70)
                                .shadow(color: .gray, radius: 1, x: 0, y: 5)
                            
                            Text("Main Menu")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }
                    }
                }
                Spacer()
            }
            .frame(width: geometry.size.width)
            
        }
        .navigationBarHidden(true)
        .padding()
    }
    
}


struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(score: .constant(10))
    }
}
