//
//  mathdownApp.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

@main
struct mathdownApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MainMenuView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { scene in
            
            switch(scene) {
                
            case .background:
                print("Scene is background")
                persistenceController.save()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("Apple must have changed something")
            }
        }
        
    }
}
