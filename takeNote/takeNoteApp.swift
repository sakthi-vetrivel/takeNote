//
//  takeNoteApp.swift
//  takeNote
//
//  Created by Sakthi Vetrivel on 8/20/24.
//

import SwiftUI
import SwiftData

@main
struct takeNoteApp: App {
    
    let modelContainer: ModelContainer
       init() {
           do {
               modelContainer = try ModelContainer(for: Note.self)
           } catch {
               fatalError("Could not initialize ModelContainer")
           }
        
       }
       
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Note.self])
//                .environment(\.font, Font.custom("Oswald-Regular", size: 14))
        }
        
    }
}
