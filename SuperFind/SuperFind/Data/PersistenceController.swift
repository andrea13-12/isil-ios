//
//  PersistenceController.swift
//  SuperFind
//
//  Created by Andrea Torres on 14/07/25.
//

import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    private init () {
        container = NSPersistentContainer(name: "HeroModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
