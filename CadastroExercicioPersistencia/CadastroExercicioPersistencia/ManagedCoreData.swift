//
//  ManagedCoreData.swift
//  CadastroExercicioPersistencia
//
//  Created by Helaine Alves Pontes on 04/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.


import CoreData

class ManagedCoreData {
    static let shared = ManagedCoreData()
    
    private init(){}
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CadastroExercicioPersistencia")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
    
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext () {
        let context = persistentContainer.viewContext
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
