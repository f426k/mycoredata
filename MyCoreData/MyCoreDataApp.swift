//
//  MyCoreDataApp.swift
//  MyCoreData
//
//  Created by Fuka Takashima on 2023/07/20.
//

import SwiftUI

@main
struct MyCoreDataApp: App {
    let persistenceController = PersistenceController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
