//
//  CoreDataManager.swift
//  CoreDataExercicioLista
//
//  Created by Helaine Alves Pontes on 08/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    private init(){}
    
    static var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "CoreDataExercicioLista")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = CoreDataManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
