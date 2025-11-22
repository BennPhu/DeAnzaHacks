//
//  SecondServeApp.swift
//  SecondServe
//
//  Created by Marc Rodenas Guasch on 21/11/25.
//

import SwiftUI
import FirebaseCore

@main
struct SecondServeApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
