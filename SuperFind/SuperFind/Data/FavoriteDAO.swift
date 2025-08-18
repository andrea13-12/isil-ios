//
//  FavoriteDAO.swift
//  SuperFind
//
//  Created by Andrea Torres on 15/07/25.
//

import CoreData

class FavoriteDAO {
    
    static let shared = FavoriteDAO()
    
    let context = PersistenceController.shared.container.viewContext
    
    private init() {}
    
    private func saveContext(){
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    
    func insertFavorite(hero: Hero) {
        let entity = FavoriteEntity(context: context)
        entity.name = hero.name
        entity.id = String(hero.id)
        entity.aliases = hero.biography.aliases.joined(separator: ", ")
        entity.image = hero.image
        saveContext()
    }
    
    func deleteFavorite(id: String) {
           let fetchRequest: NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "id = %@", id)
           do {
               let entities = try context.fetch(fetchRequest)
               if let entity = entities.first {
                   context.delete(entity)
                   saveContext()
               }
           } catch let error {
               fatalError(error.localizedDescription)
           }
       }
    
    func fetchAll() -> [Favorite] {
        let fetchRequest: NSFetchRequest<FavoriteEntity>
        fetchRequest = FavoriteEntity.fetchRequest()

        
        do {
            let entities = try context.fetch(fetchRequest)
            return entities.map { entity in
                Favorite(id: entity.id ?? "",
                         name: entity.name ?? "",
                         image: entity.image ?? "",
                         aliases: entity.aliases ?? ""
                )
            }
            
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func isFavorite(id: String) -> Bool {
        let fetchRequest: NSFetchRequest<FavoriteEntity>
        fetchRequest = FavoriteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: " id = %@", id)
        
        do {
            let entities = try context.fetch(fetchRequest)
            return !entities.isEmpty
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
}

