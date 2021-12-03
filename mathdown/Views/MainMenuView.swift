//
//  ContentView.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

struct MainMenuView: View {
    
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader{ geometry in
                
                VStack {
                    
                    Spacer()
                    
                    Text("Title")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    VStack(spacing: geometry.size.height / 20) {
                        NavigationLink {
                            CountdownView()
                        } label: {
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width: geometry.size.width, height: geometry.size.width / 4)
                                Text("Start")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        NavigationLink {
                            EmptyView()
                        } label: {
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width: geometry.size.width, height: geometry.size.width / 4)
                                Text("Highscore")
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }

                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

