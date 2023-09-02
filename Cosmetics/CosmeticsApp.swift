//
//  CosmeticsApp.swift
//  Cosmetics
//
//  Created by Елена Крылова on 03.08.2023.
//

import SwiftUI

@main
struct CosmeticsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FirstView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
