//
//  GestionPublicationApp.swift
//  GestionPublication
//
//  Created by MacOS on 4/11/2023.
//

import SwiftUI

@main
struct GestionPublicationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                
            }
                
        }
    }
}
