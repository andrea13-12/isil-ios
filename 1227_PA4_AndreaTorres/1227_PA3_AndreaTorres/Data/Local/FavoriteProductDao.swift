//
//  FavoriteProductDao.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 27/06/25.
//

import CoreData

class FavoriteProductDao {
    static let shared = FavoriteProductDao()
    
    private init() {}
    
    private let context = PersistenceController.shared.container.viewContext
    
    func insertFavorite(favorite: FavoriteProduct){
        let entity = FavoriteProductEntity(context: context)
        entity.fromDomain(favorite: favorite)
        saveContext()
    }
    
    func deleteFavorite(id: Int) {
        let request: NSFetchRequest<FavoriteProductEntity>
        request = FavoriteProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %i", argumentArray: [id])
        
        do {
            let entities = try context.fetch(request)
            if let entity = entities.first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchAllFavorites() -> [FavoriteProduct] {
        let request: NSFetchRequest<FavoriteProductEntity>
        request = FavoriteProductEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            return entities.map { $0.toDomain()}
          
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func checkFavorite(id: Int) -> Bool {
        let request: NSFetchRequest<FavoriteProductEntity>
        request = FavoriteProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %i", argumentArray: [id])
        
        do {
            let entities = try context.fetch(request)
            print(!entities.isEmpty)
            return !entities.isEmpty
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext() {
        if context.hasChanges {
            
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
