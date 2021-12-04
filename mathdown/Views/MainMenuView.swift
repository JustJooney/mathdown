//
//  ContentView.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

struct MainMenuView: View {
    
    @State var toScoreView = false
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader{ geometry in
                
                ZStack {
                    
                    Spacer()
                        .sheet(isPresented: $toScoreView) {
                            HighscoreView()
                        }
                    
                    VStack {
                        
                        Spacer()
                        
                        Text("MultiTimed")
                            .font(.system(size: 60))
                            .bold()
                        
                        Spacer()
                        
                        VStack(spacing: 30) {
                            NavigationLink {
                                CountdownView()
                            } label: {
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.black)
                                        .frame(width: geometry.size.width * 0.8, height: 70)
                                        .shadow(color: .gray, radius: 1, x: 0, y: 5)
                                        
                                    Text("Start")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }
                            }
                            
                            Button {
                                toScoreView.toggle()
                            } label: {
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.black)
                                        .frame(width: geometry.size.width * 0.8, height: 70)
                                        .shadow(color: .gray, radius: 1, x: 0, y: 5)
                                        
                                    Text("Score List")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }
                            }
                        }
                        Spacer()
                        
                    }
                    .frame(width: geometry.size.width)
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

