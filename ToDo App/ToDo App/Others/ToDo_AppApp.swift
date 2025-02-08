//
//  ToDo_AppApp.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//
import FirebaseCore
import SwiftUI

@main
struct ToDo_AppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
