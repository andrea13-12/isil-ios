//
//  PersistenceController.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 27/06/25.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init (){
        container = NSPersistentContainer(name: "ProductsModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
