//
//  Todo_appApp.swift
//  Todo app
//
//  Created by Kacper Wojak on 19/10/2024.
//

import SwiftUI
import FirebaseCore

@main
struct Todo_appApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
