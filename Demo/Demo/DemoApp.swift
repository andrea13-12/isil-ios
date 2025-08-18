//
//  DemoApp.swift
//  Demo
//
//  Created by Andrea Torres on 14/04/25.
//

import SwiftUI
import SwiftData

@main
struct DemoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TaskList()
        }
        .modelContainer(sharedModelContainer)
    }
}
