//
//  PauseView.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

struct PauseView: View {
    var body: some View {
            ZStack {
                Rectangle()
                    .fill(.yellow)
                    .ignoresSafeArea()
                
                VStack {
                    NavigationLink {
                        CountdownView()
                            .navigationBarHidden(true)
                    } label: {
                        Text("Restart")
                    }
                    
                    NavigationLink {
                        MainMenuView()
                            .navigationBarHidden(true)
                    } label: {
                        Text("Go Back")
                    }
                } 
            }
            .navigationBarHidden(true)
    }
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView()
    }
}
