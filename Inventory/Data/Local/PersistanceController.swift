//
//  PersistanceController.swift
//  Inventory
//
//  Created by Andrea Torres on 19/05/25.
//

import CoreData
class PersistanceController {
    static let shared = PersistanceController ()
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "InventoryModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        
        }
        
    }
}
