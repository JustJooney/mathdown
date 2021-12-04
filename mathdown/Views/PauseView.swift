//
//  PauseView.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

struct PauseView: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                Rectangle()
                    .fill(.white)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Pause")
                        .foregroundColor(.black)
                        .font(.system(size: 100))
                    
                    VStack(spacing: 50) {
                        NavigationLink {
                            CountdownView()
                                .navigationBarHidden(true)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                                    .frame(width: geometry.size.width * 0.6, height: 80)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 5)
                                    
                                Text("Restart")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                            }
                            
                        }
                        
                        NavigationLink {
                            MainMenuView()
                                .navigationBarHidden(true)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                                    .frame(width: geometry.size.width * 0.8, height: 80)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 5)
                                    
                                Text("Main Menu")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                            }
                        }
                        
                        
                        
                        Text("In case you were wondering, there is no continue option. The challenge is for you to think quickly on your feet.")
                            .font(.caption)
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView()
    }
}
