//
//  PersistenceController.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Exam_Darsh_ShahApp")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data load error: \(error)")
            }
        }
    }
}
