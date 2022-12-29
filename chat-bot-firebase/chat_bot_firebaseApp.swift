//
//  chat_bot_firebaseApp.swift
//  chat-bot-firebase
//
//  Created by Luis Camargo on 28/12/22.
//

import SwiftUI
import Firebase

@main
struct chat_bot_firebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
