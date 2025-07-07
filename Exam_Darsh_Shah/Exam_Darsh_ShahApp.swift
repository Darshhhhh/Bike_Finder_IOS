//
//  Exam_Darsh_ShahApp.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//

import SwiftUI

@main
struct Exam_Darsh_ShahApp: App {
    let persistenceController: PersistenceController

    init() {
        self.persistenceController = PersistenceController.shared
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
               .environment(\.managedObjectContext,
                            persistenceController.container.viewContext)
        }
    }
}
